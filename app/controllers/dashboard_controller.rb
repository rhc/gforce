class DashboardController < ApplicationController
  def index
    @clients = Client.order(:first_name, :last_name).page( params[:page])
  end

end
