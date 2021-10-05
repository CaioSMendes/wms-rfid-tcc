class SellsController < ApplicationController
  before_action :set_sell, only: %i[ show edit update destroy ]
  before_action :set_client_options, only:[:new, :edit, :show, :update, :create]
  before_action :set_product_options, only:[:new, :edit, :show, :update, :create]

  # GET /sells or /sells.json
  def index
    @sells = Sell.paginate(page: params[:page], per_page: 10)
    @q = Sell.ransack(params[:q])
    @sells = @q.result.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "venda_lista", template: "sells/index.html.erb"   # Excluding ".pdf" extension.
      end
    end 
  end

  # GET /sells/1 or /sells/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "nota_de_venda", template: "sells/sells.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /sells/new
  def new
    @sell = Sell.new
    @sell.build_tax
  end

  # GET /sells/1/edit
  def edit
  end

  # POST /sells or /sells.json
  def create
    @sell = Sell.new(sell_params)

    respond_to do |format|
      if @sell.save
        format.html { redirect_to @sell, notice: "Sell was successfully created." }
        format.json { render :show, status: :created, location: @sell }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sells/1 or /sells/1.json
  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: "Sell was successfully updated." }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1 or /sells/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url, notice: "Sell was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    def set_client_options
      @client_options = Client.all.pluck(:corporateName, :id)
    end

    def set_product_options
      @product_options = Product.all.pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def sell_params
      params.require(:sell).permit(:price, :quantity, :nameProduct, :dataSell, :discount, :measurement, :description, :product_id, :client_id,
        tax_attributes: [:shipping, :costAdd, :ipi, :icms, :description]
      )
    end
end
