class SellsController < ApplicationController
  before_action :set_sell, only: %i[ show edit update destroy ]

  # GET /sells or /sells.json
  def index
    @sells = Sell.all
  end

  # GET /sells/1 or /sells/1.json
  def show
  end

  # GET /sells/new
  def new
    @sell = Sell.new
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

    # Only allow a list of trusted parameters through.
    def sell_params
      params.require(:sell).permit(:price, :quantity, :nameProduct, :dataSell, :discount, :measurement, :description)
    end
end
