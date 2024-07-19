class BookingController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def show_all_bookings
    @bookings = Booking.all
    render json: @bookings, status: :ok
  end

  def show_booking
    @booking = Booking.find(show_booking_params[:id])
    render json: @booking, status: :ok
  end
  
  def create_booking
    @booking = Booking.new(create_booking_params)

    if @booking.save
      render json: @booking, status: :ok
    else
      render {message: "Something went wrong"}, status: :unprocessed_entity
    end
  end


  def update_booking
    @booking = Booking.find(update_booking_params)

    @booking.update(update_booking_params)
    if @booking.save
      render json: @booking, status: :ok
    else
      render {:message => "Something went wrong"}, status: :unprocessed_entity
    end 
  end

  private 

  def show_booking_params
    params.permit(:id)
  end

  def create_booking_params
    params.permit(:rv_id, :user_id, :start_date, :end_date, :total_price)
  end

  def update_booking_params
    params.permit(:id, :rv_id, :user_id, :start_date, :end_date, :total_price)
  end
end
