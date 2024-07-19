require 'bcrypt'

class UserController < ApplicationController
  include BCrypt
  skip_before_action :verify_authenticity_token


  def show_all_users
    @users = User.all
    render json: @users
  end

  def show_user
    @user = User.find(show_user_params[:id])
    render json: @user
  end

  def create_user
    secure_params = {
                      name: create_user_params[:name], 
                      email: create_user_params[:email], 
                      password: Password.create(create_user_params[:password])
                    }
    @user = User.new(secure_params)
    if @user.save
      render json: @user, status: :ok
    else
      render json: "Error creating user", status: :unprocessed_entity
    end
  end

  def update_user
    @user = User.find(update_user_params[:id])
    update_user_params.delete(:id)
    @user.update(update_user_params)

    if @user.save
      render json: @user, status: :ok
    else
      render json: "Error updating user", status: :unprocessed_entity
    end
  end

  private

  def show_user_params
    params.permit(:id)
  end

  def create_user_params
    params.permit(:name, :email, :password)
  end

  def update_user_params
    params.permit(:id, :name, :email, :password)
  end
end
