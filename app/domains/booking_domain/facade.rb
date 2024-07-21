module BookingDomain
  class Facade

    def find_booking(id:)
      validate_and_handle_exceptions do
        data = Commands::FindBooking.execute(id: id)
        build_success_result(data: data)
      end
    end

    def find_all_bookings
      validate_and_handle_exceptions do
        data = Commands::FindAllBookings.execute
        build_success_result(data: data)
      end
    end

    def create_booking(dto)
      validate_and_handle_exceptions do
        data = Commands::CreateBooking.execute(dto: dto)
        build_success_result(data: data)
      end
    end

    private

    def validate_and_handle_exceptions
      yield
    rescue Exceptions::BookingException => e
      build_error_result(e)
    rescue StandardError => e
      build_unexpected_error_result(e)
    end

    def build_error_result(exception = nil, message: nil, status: nil)
      DTOS::CommandResult.new(
        message: message || exception.message,
        status: status || exception.status
      )
    end

    def build_unexpected_error_result(exception)
      build_error_result(
        message: exception.message,
        status: :unprocessable_entity
      )
    end

    def build_success_result(data: nil, status: :ok)
      DTOS::CommandResult.new(data: data, status: status)
    end

    def validate_parameters
      
    end
  end
end