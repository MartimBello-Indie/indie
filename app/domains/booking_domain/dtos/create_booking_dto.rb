module BookingDomain
  module DTOS
    class CreateBookingDto
      attr_accessor :rv_id, :user_id, :start_date, :end_date

      def initialize(
        rv_id: nil,
        user_id: nil,
        start_date: nil,
        end_date: nil
        )
        @rv_id = rv_id
        @user_id = user_id
        @start_date = start_date
        @end_date = end_date
      end

      def nil_params?

        if @rv_id.nil? || @user_id.nil? || @start_date.nil? || @end_date.nil?
          return true
        end

        false
      end

      def params
        {
          rv_id: @rv_id,
          user_id: @user_id,
          start_date: @start_date,
          end_date: @end_date
        }
      end
    end
  end
end