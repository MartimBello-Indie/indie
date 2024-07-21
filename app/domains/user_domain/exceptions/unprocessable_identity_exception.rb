module UserDomain
  module Exceptions
    class UnprocessableIdentityException < StandardError
      attr_reader :status

      def initialize(message, status)
        super(message)

        @status = status
      end
    end
  end
end