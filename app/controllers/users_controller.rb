class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(formatted_permitted_params)

    if @user.save
      @user
    else
      render :new
    end
  end

  private

  def formatted_permitted_params
    {
      **permitted_params.slice(:source, :zip),
      first_name: permitted_params[:first_name].downcase.capitalize,
      last_name: permitted_params[:last_name].downcase.capitalize,
      email: permitted_params[:email].downcase
    }
  end

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
