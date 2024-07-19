module RvDomain
  module Exceptions
    class UnprocessableEntityException < PartnerException
      def initialize(message)
        super(message, :unprocessable_entity)
      end
    end
  end
end