module RvDomain
  module Exceptions
    class BadRequestException < RvException
      def initialize(message)
        super(message, :bad_request)
      end
    end
  end
end