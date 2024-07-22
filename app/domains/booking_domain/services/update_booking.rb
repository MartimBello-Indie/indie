module BookingDomain
  module Services
    class UpdateBooking
      def update_booking(params:, booking:)

        if booking.update(params)
          booking
        else
          raise Exceptions::UnprocessableIdentityException.new("Unknown error during booking update.")
        end
      end
    end
  end
end