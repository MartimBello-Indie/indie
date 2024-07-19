module RvDomain
  module Exceptions
    class NotFoundException < RvException
      def initialize(message)
        super(message, :not_found)
      end
    end
  end
end