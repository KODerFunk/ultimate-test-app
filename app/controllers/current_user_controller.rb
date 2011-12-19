class CurrentUserController < ApplicationController
  respond_to :html, :json

  def show
    @user = current_user
    respond_with @user do |format|
      format.html { render "users/show" }
    end
  end

end
