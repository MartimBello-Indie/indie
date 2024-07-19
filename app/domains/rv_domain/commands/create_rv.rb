module RvDomain
  module Commands
    class CreateRv < Command

      def execute(dto:)
        @dto = dto
        
        validate_parameters

        create_rv

      end

      private

      def validate_parameters
        if @dto.nil_params?
          raise Exceptions::BadRequestException.new("Request missing parameters.")
        end
      end

      def create_rv 
        @rv = Rv.new(@dto.params)

        if @rv.save
          @rv
        else
          raise Exceptions::UnprocessableEntityException.new("Unknown error in rv creation.")
        end
      end
    end
  end
end