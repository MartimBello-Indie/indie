module BookingDomain
  module Services
    class ParseDate
      def parse!(date)
        Date.strptime(date, "%d-%m-%Y")
      rescue ArgumentError
        raise Exceptions::InvalidDateFormat.new
      end
    end
  end
end