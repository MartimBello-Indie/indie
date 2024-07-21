module UserDomain
  module Exceptions
    class UserNotFoundException < NotFoundException
      def initialize(id:)
        super("Rv with id '#{id}' not found")
      end
    end
  end
end