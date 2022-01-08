class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.paginate(page: params[:page], per_page: 10)
    @q = Client.ransack(params[:q])
    @clients = @q.result.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "lista_cliente", template: "clients/index.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /clients/1 or /clients/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "detalhe_do_cliente", template: "clients/clients.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end
  
  # GET /clients/new
  def new
    @client = Client.new
    @client.build_address
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(
        :corporateName, :clientName, :name, :phone, :cnpj, :email, :codeClient,
        address_attributes: [:city, :street, :neighborhood, :number, :complement, :state, :zipcode]
      )
    end
end
