module BookingDomain
  module Commands
    class FindBooking
      def execute(id:)
        Booking.find(id)
 
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::BookingNotFound.new(id)  
      end
    end
  end
end