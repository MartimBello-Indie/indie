module UserDomain
  module Exceptions
    class NotFoundException < UserException
      def initialize(message)
        super(message, :not_found)
      end
    end
  end
end