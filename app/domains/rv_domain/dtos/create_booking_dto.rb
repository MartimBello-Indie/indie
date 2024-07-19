module RvDomain
  module DTOS
    class CreateBookingDto
      attr_accessor :data, :message, :status

      def initialize(
        make: nil,
        model: nil,
        year: nil,
        description: nil,
        image_url: nil,
        daily_rate: nil
        )
        @make = make
        @model = model
        @year = year
        @description = description
        @image_url = image_url
        @daily_rate = daily_rate
      end

      def nil_params?
        if @make.nil? || @model.nil? || @year.nil? || @description.nil? || @image_url.nil? || @daily_rate.nil?
          true
        end
        false
      end

      def params
        {
          make: @make,
          model: @model,
          year: @year,
          description: @description,
          image_url: @image_url,
          daily_rate: @daily_rate
        }
      end
    end
  end
end