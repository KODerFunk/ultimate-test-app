class UsersController < ApplicationController
  respond_to :html, :json

  def index

  end

  def show
    @user = current_user
    respond_with @user
  end

  def edit
    #respond_with_navigational(resource){ super }
  end

end
