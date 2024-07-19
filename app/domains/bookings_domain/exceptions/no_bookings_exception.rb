module BookingDomain
  module Exceptions
    class BookingNotFound < NotFoundException
      def initialize()
        super("There are no bookings")
      end
    end
  end
end