class PlansController < ApplicationController

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id]) || (render "layouts/404")
  end

  def new
  end

end
