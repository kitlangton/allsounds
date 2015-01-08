class AdminController < ApplicationController
  before_action :authenticate

  def index
  end

  private

  def authenticate
    unless current_user.try(:admin?)
      redirect_to root_url
    end
  end
end
