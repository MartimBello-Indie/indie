module UserDomain
  module Commands
    class CreateUser < Command

      def execute(dto:)
        @dto = dto

        validate_parameters

        create_user

      end

      private

      def validate_parameters
        raise Exceptions::BadRequestException.new("Request missing parameters.") unless not @dto.nil_params?
      end

      def create_user
        @user = User.new(@dto.params)

        if @user.save
          @user
        else
          raise Exceptions::UnprocessableIdentityExceptions.new("Unknown error in user creation.")
        end
      end
    end
  end
end