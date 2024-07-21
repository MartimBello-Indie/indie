module BookingDomain
  module Services
    class CreateBooking
      def create_booking(params: )
        
        @booking = Booking.new(params)
        if @booking.save
          @booking
        else
          raise Exceptions::UnprocessableIdentityException.new("Unknown error during booking creation.")
        end
      end
    end
  end
end