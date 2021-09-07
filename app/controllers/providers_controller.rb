class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[ show edit update destroy ]

  # GET /providers or /providers.json

  def filter_by_query
    @providers = @providers.ransack(corporateName_or_fantasyName_cont: params[:q]).result  
  end 

  def index
    @providers = Provider.paginate(page: params[:page], per_page: 10)
    filter_by_query if params[:q]
  end

  # GET /providers/1 or /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @provider.build_address
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers or /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: "Provider was successfully created." }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1 or /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: "Provider was successfully updated." }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1 or /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: "Provider was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provider_params
      params.require(:provider).permit(:corporateName, :fantasyName, :phone, :cnpj, :stateRegistration, :email, :business, :codeProvider,
        address_attributes: [:city, :street, :neighborhood, :number, :complement, :state, :zipcode]
      )
    end
end
