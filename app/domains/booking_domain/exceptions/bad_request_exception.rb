# frozen_string_literal: true

module BookingDomain
  module Exceptions
    class BadRequestException < BookingException
      def initialize(message)
        super(message, :bad_request)
      end
    end
  end
end
