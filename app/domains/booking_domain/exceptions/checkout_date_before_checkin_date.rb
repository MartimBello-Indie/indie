# frozen_string_literal: true

module BookingDomain
  module Exceptions
    class CheckoutDateBeforeCheckinDate < BadRequestException
      def initialize
        super("Check-out date must be after check-in date")
      end
    end
  end
end
