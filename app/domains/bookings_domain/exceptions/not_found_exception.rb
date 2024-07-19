module BookingDomain
  module Exceptions
    class NotFoundException < PartnerException
      def initialize(message)
        super(message, :not_found)
      end
    end
  end
end