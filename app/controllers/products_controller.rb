class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_categorie_options, only:[:new, :edit, :show, :update, :create]
  # GET /products or /products.json

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
    @q = Product.ransack(params[:q])
    @products = @q.result.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "produto_lista", template: "products/index.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "detalhes_do_produto", template: "products/products.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    #@product.build_categorie
    #@product.build_provider
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_categorie_options
      @categorie_options = Categorie.all.pluck(:nameCat, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id]) # CERTO
      #@product = Product.find(params[:rfid]
      #@product = Product.where(params[:rfid])
    end

    def product_rfid_params
      params.require(:product).permit(:rfid)
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :quantity, :unity, :price, :date, :productCode, :gtin, :rfid, :productMin, :productMax, :salePrice, :saleCost, :avaliable, :image ,:categorie_id,
        #categorie_attributes: [:name, :codCategorie],
        #provider_attributes: [:fantasyName, :cnpj]
      )
    end
end