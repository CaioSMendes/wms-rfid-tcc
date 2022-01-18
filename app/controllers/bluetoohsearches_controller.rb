class BluetoohsearchesController < ApplicationController
  before_action :set_bluetoohsearch, only: %i[ show edit update destroy ]
  before_action :set_codeRfid_service

  # GET /bluetoohsearches or /bluetoohsearches.json
  def index
    @resultsApiCode = @summary_service.codeAPI
    @products = Product.paginate(page: params[:page], per_page: 10)
    #@bluetoohsearches = Bluetoohsearch.all
  end

  # GET /bluetoohsearches/1 or /bluetoohsearches/1.json
  def show
  end

  # GET /bluetoohsearches/new
  def new
    @bluetoohsearch = Bluetoohsearch.new
  end

  # GET /bluetoohsearches/1/edit
  def edit
  end

  # POST /bluetoohsearches or /bluetoohsearches.json
  def create
    @bluetoohsearch = Bluetoohsearch.new(bluetoohsearch_params)

    respond_to do |format|
      if @bluetoohsearch.save
        format.html { redirect_to @bluetoohsearch, notice: "Bluetoohsearch was successfully created." }
        format.json { render :show, status: :created, location: @bluetoohsearch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bluetoohsearch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bluetoohsearches/1 or /bluetoohsearches/1.json
  def update
    respond_to do |format|
      if @bluetoohsearch.update(bluetoohsearch_params)
        format.html { redirect_to @bluetoohsearch, notice: "Bluetoohsearch was successfully updated." }
        format.json { render :show, status: :ok, location: @bluetoohsearch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bluetoohsearch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bluetoohsearches/1 or /bluetoohsearches/1.json
  def destroy
    @bluetoohsearch.destroy
    respond_to do |format|
      format.html { redirect_to bluetoohsearches_url, notice: "Bluetoohsearch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_codeRfid_service
      @summary_service = CodeRfidUpc.new
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bluetoohsearch
      @bluetoohsearch = Bluetoohsearch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bluetoohsearch_params
      params.require(:bluetoohsearch).permit(:rfidCode)
    end
end
