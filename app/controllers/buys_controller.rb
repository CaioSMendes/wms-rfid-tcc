class BuysController < ApplicationController
  before_action :set_buy, only: %i[ show edit update destroy ]
  before_action :set_provider_options, only:[:new, :edit, :show, :update, :create]


  # GET /buys or /buys.json
  def index
    @buys = Buy.all
    @totbuy = Buy.total
  end

  # GET /buys/1 or /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new
    @buy.build_tax
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys or /buys.json
  def create
    @buy = Buy.new(buy_params)

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: "Buy was successfully created." }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1 or /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: "Buy was successfully updated." }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1 or /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: "Buy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_provider_options
      @provider_options = Provider.all.pluck(:corporateName, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buy_params
      params.require(:buy).permit(:price, :quantity, :nameProduct, :dateBuy, :discount, :measurement, :description, :provider_id,
        tax_attributes: [:shipping, :costAdd, :ipi, :icms]
      )
    end
end