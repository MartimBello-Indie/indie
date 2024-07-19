module RvDomain
  module DTOS
    class CommandResult
      attr_accessor :data, :message, :status

      def initialize(data: nil, message: nil, status: :ok)
        @data = data
        @message = message
        @status = status
      end

      def success?
        @status == :ok
      end
    end
  end
end