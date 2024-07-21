require 'bcrypt'

class UserController < ApplicationController
  include BCrypt
  skip_before_action :verify_authenticity_token

  def show_user
    result = facade.find_user(id: show_user_params[:id])
    render_result(result)
  end

  def create_user
    result = facade.create_user(
      UserDomain::DTOS::CreateUserDto.new(
        name: create_user_params[:name],
        email: create_user_params[:email],
        password: create_user_params[:password]
      )
    )
    render_result(result)
  end

  def update_user
    @user = User.find(update_user_params[:id])
    update_user_params.delete(:id)
    @user.update(update_user_params)

    if @user.save
      render json: @user, status: :ok
    else
      render json: 'Error updating user', status: :unprocessed_entity
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

  def facade
    ::UserDomain::Facade.new
  end

  def render_result(result)
    render json: build_json(result.data, result.message), status: result.status
  end

  def build_json(data, message)
    {
      data: data || {},
      message: message.to_s
    }
  end
end
