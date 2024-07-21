module BookingDomain
  module Exceptions
    class BookingNotFound < NotFoundException
      def initialize(public_booking_reference)
        super("Booking with id '#{public_booking_reference}' not found")
      end
    end
  end
end