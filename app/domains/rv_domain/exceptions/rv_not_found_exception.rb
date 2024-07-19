module RvDomain
  module Exceptions
    class RvNotFoundException < NotFoundException
      def initialize(id:)
        super("Rv with id '#{id}' not found")
      end
    end
  end
end