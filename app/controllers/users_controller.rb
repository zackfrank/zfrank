class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(permitted_params)
  end

  private

  def permitted_params
    params.require(:user)
          .permit(
            :first_name,
            :last_name,
            :email,
            :source,
            :zip
          )
  end
end
