# frozen_string_literal: true

module BookingDomain
  module Services
    class ValidateDates

      def validate!(checkin_date, checkout_date)
        raise Exceptions::CheckoutDateBeforeCheckinDate unless checkout_date > checkin_date
      end
    end
  end
end