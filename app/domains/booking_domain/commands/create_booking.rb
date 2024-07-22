module BookingDomain
  module Commands
    class CreateBooking < Command

      def initialize(
        create_booking_service: Services::CreateBooking.new,
        validate_dates_service: Services::ValidateDates.new,
        parse_date_service: Services::ParseDate.new,
        find_rv_command: RvDomain::Commands::FindRv.new
      )
        @create_booking_service = create_booking_service
        @validate_dates_service = validate_dates_service
        @parse_date_service = parse_date_service
        @find_rv_command = find_rv_command
      end

      def execute(dto:)
        @dto = dto 
        @params = dto.params

        validate_parameters

        calculate_total_price

        @create_booking_service.create_booking(params: @params)
      end

      private

      def validate_parameters
        if @dto.nil_params?
          puts "here 2"
          raise Exceptions::BadRequestException.new("Request is missing parameters.")
        end

        if not @dto.status.nil?
          if not ["active", "completed", "cancelled"].include? @dto.status
            raise Exceptions::BadRequestException.new("Status #{@dto.status} is invalid")
          end
        end

        @start_date = @parse_date_service.parse!(@dto.start_date)
        @end_date = @parse_date_service.parse!(@dto.end_date)

        @validate_dates_service.validate!(@start_date, @end_date)
      end

      def calculate_total_price
        rv_data = @find_rv_command.execute(id: @dto.rv_id)

        total_price = (@end_date - @start_date).to_i * rv_data[:daily_rate]

        @params.merge!({total_price: total_price})

      rescue RvDomain::Exceptions::RvNotFoundException
        raise Exceptions::BadRequestException.new("Rv with id #{@dto.rv_id} does not exist")
      end

    end
  end
end
