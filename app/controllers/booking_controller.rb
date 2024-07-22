class BookingController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def show_all_bookings
    result = facade.find_all_bookings
    render_result(result)
  end

  def show_booking
    result = facade.find_booking(id: show_booking_params[:id])
    render_result(result)
  end

  def create_booking
    result = facade.create_booking(
      BookingDomain::DTOS::CreateBookingDto.new(
        rv_id: create_booking_params[:rv_id],
        user_id: create_booking_params[:user_id],
        start_date: create_booking_params[:start_date],
        end_date: create_booking_params[:end_date],
        status: create_booking_params[:status]
      )
    )
    render_result(result)
  end

  def update_booking
    result = facade.update_booking(params: update_booking_params)
    render_result(result)
  end

  private 

  def show_booking_params
    params.permit(:id)
  end

  def create_booking_params
    params.permit(:rv_id, :user_id, :start_date, :end_date, :total_price, :status)
  end

  def update_booking_params
    params.permit(:id, :rv_id, :end_date, :status)
  end

  def facade
    ::BookingDomain::Facade.new
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
