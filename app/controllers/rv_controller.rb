class RvController < ApplicationController

  skip_before_action :verify_authenticity_token

  def show_all_rvs
    result = facade.find_all_rvs

    render_result(result)
  end

  def show_rv
    result = facade.find_rv(id: show_rv_params[:id])

    render_result(result)
  end

  def create_rv
    result = facade.create_rv(
      RvDomain::DTOS::CreateRvDto.new(
        make: create_rv_params[:make],
        model: create_rv_params[:model],
        year: create_rv_params[:year],
        description: create_rv_params[:description],
        image_url: create_rv_params[:image_url],
        daily_rate: create_rv_params[:daily_rate],
      )
    )

    render_result(result)
  end

  def update_rv
    result = facade.update_rv(
      update_params: update_rv_params
    )
    render_result(result)
  end

  private

  def show_rv_params
    params.permit(:id)
  end

  def create_rv_params
    params.permit(:make, :model, :year, :description, :image_url, :daily_rate)
  end

  def update_rv_params
    params.permit(:id, :make, :model, :year, :description, :image_url, :daily_rate)
  end

  def facade
    ::RvDomain::Facade.new
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
