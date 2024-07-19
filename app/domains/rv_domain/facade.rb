module RvDomain
  class Facade

    def find_rv(id:)
      validate_and_handle_exceptions do
        data = Commands::FindRv.execute(id: id)
        build_success_result(data: data)
      end
    end

    def find_all_rvs
      validate_and_handle_exceptions do
        data = Commands::FindAllRvs.execute
        build_success_result(data: data)
      end
    end

    def create_rv(dto)
      validate_and_handle_exceptions do
        data = Commands::CreateRv.execute(dto: dto)
        build_success_result(data: data)
      end
    end

    def update_rv(update_params:)
      validate_and_handle_exceptions do
        data = Commands::UpdateRv.execute(update_params: update_params)
        build_success_result(data: data)
      end
    end

    private

    def validate_and_handle_exceptions
      yield
    rescue Exceptions::RvException => e
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