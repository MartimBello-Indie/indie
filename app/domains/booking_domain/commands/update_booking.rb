module BookingDomain
  module Commands
    class UpdateBooking < Command

      def initialize(
        update_booking_service: Services::UpdateBooking.new,
        validate_dates_service: Services::ValidateDates.new,
        parse_date_service: Services::ParseDate.new,
        find_rv_command: RvDomain::Commands::FindRv.new,
        find_booking_command: FindBooking.new
      )
        super()
        @update_booking_service = update_booking_service
        @validate_dates_service = validate_dates_service
        @parse_date_service = parse_date_service
        @find_rv_command = find_rv_command
        @find_booking_command = find_booking_command
      end

      def execute(params:)
        @params = params

        @booking_data = find_booking

        @rv_data = find_rv

        validate_parameters

        calculate_total_price if @params.key?('end_date') || @params.key?('rv_id')

        @update_booking_service.update_booking(params: @params, booking: @booking_data)
      end

      private

      def find_booking
        @find_booking_command.execute(id: @params[:id])
      end

      def find_rv
        if @params.key?('rv_id')
          id = @params[:rv_id]
          @find_rv_command.execute(id: @params[:rv_id])
        else
          id = @booking_data.rv_id
          @find_rv_command.execute(id: @booking_data.rv_id)
        end
      rescue RvDomain::Exceptions::RvNotFoundException
        raise Exceptions::BadRequestException.new("Rv with id #{id} does not exist")
      end

      def validate_parameters

        @start_date = @booking_data.start_date

        if @params.key?('end_date')
          @end_date = @parse_date_service.parse!(@params[:end_date])

          @validate_dates_service.validate!(@booking_data.start_date, @end_date)
        else
          @end_date = @booking_data.end_date
        end

        return unless @params.key?('status')
        if not ["active", "completed", "cancelled"].include? @params[:status]
          raise Exceptions::BadRequestException.new("Status #{@params[:status]} is invalid")
        end
      end

      def calculate_total_price
        puts @rv_data
        total_price = (@end_date - @start_date).to_i * @rv_data.daily_rate

        @params.merge!({total_price: total_price})

      end

    end
  end
end
