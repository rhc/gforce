class DashboardController < ApplicationController
  def index
    @clients = Client.all.page( params[:page])
  end
end
