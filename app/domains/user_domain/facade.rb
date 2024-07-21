module UserDomain
  class Facade

    def find_user(id:)
      validate_and_handle_exceptions do
        data = Commands::FindUser.execute(id: id)
        build_success_result(data: data)
      end
    end

    def create_user(dto)
      validate_and_handle_exceptions do
        data = Commands::CreateUser.execute(dto: dto)
        build_success_result(data: data)
      end
    end

    private

    def validate_and_handle_exceptions
      yield
    rescue Exceptions::UserException => e
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
  end
end