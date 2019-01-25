class ApplicationController < ActionController::Base
  before_action :clear_flash

  private

  def clear_flash
    flash.clear
  end
end
