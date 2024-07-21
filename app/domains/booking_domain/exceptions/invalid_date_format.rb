# frozen_string_literal: true

module BookingDomain
  module Exceptions
    class InvalidDateFormat < BadRequestException
      def initialize
        super("Date time is invalid, must follow DD-MM-YYYY format")
      end
    end
  end
end
