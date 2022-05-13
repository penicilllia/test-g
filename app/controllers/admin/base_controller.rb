class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_requred!

  private

  def admin_requred!
    redirect_to root_path, alert: 'You are not authorised to view this page!' unless current_user.is_a?(Admin)
  end

end