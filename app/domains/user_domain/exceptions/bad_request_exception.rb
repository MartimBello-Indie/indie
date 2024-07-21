module UserDomain
  module Exceptions
    class BadRequestException < UserException
      def initialize(message)
        super(message, :bad_request)
      end
    end
  end
end