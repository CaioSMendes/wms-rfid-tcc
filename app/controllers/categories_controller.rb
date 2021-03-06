class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  
  # GET /categories or /categories.json
  def index
    @categories = Categorie.paginate(page: params[:page], per_page: 10)
    @q = Categorie.ransack(params[:q])
    @categories = @q.result.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "categoria_lista", template: "categories/index.html.erb"   # Excluding ".pdf" extension.
      end
    end
    #@q = Categorie.ransack(params[:q])
    #@categories = @q.result
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Categorie.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Categorie.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Categorie was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Categorie was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Categorie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Categorie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:categorie).permit(:nameCat, :codCategorie)
    end
end
