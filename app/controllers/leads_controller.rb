class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.save
    redirect_to root_path
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :email, :message)
  end

end
