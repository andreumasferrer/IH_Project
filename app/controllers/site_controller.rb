class SiteController < ApplicationController
  def home
    redirect_to plans_path if user_signed_in? 
  end
end
