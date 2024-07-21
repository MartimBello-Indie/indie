module BookingDomain
  module Commands
    class FindAllBookings < Command
      def execute()
        Booking.all
  
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::NoBookingsException.new
      
      end
    end 
  end
end