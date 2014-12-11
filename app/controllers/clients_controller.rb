class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :watch]

  def index
    @clients = Client.order(:first_name, :last_name).page params[:page]
  end

  def search
    @clients = Client.search params[:search]
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = "Client has been registered."
      redirect_to clients_path 
    else
      flash[:alert] = " Client has not been registered."
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:notice] = "Client has been updated."
      redirect_to clients_path 
    else
      render :edit
    end
  end


  def destroy
  end

private

  def client_params
    params
      .require(:client)
      .permit(:first_name, :last_name, :birth_date, :gender, :email, :mobile_phone)
  end

  def set_client
    @client = Client.find(params[:id])
  end


end
