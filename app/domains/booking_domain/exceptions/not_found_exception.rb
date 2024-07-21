module BookingDomain
  module Exceptions
    class NotFoundException < BookingException
      def initialize(message)
        super(message, :not_found)
      end
    end
  end
end