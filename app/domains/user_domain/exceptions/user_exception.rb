module UserDomain
  module Exceptions
    class UserException < StandardError
      attr_reader :status

      def initialize(message, status)
        super(message)

        @status = status
      end
    end
  end
end