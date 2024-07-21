require 'bcrypt'

module UserDomain
  module DTOS
    class CreateUserDto
      include BCrypt
      attr_accessor :data, :message, :status

      def initialize(
        name: nil,
        email: nil,
        password: nil
        )
        @name = name
        @email = email
        @password = Password.create(password)
      end

      def nil_params?
        if @name.nil? || @email.nil? || @password.nil?
          true
        end
        false
      end

      def params
        {
          name: @name,
          email: @email,
          password: @password
        }
      end
    end
  end
end