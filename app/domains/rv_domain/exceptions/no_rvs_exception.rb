module RvDomain
  module Exceptions
    class NoRvsException < NotFoundException
      def initialize
        super('There are no rvs')
      end
    end
  end
end