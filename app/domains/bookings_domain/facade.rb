module BookingDomain
  class Facade
    
    def find_booking(id:)
      data = Commands::FindBooking.execute(id)
      build_success_result(data)
    end

    def find_all_bookings()
      data = Commands::FindAllBookings.execute()
      build_success_result(data)
    end

    private

    def build_success_result(data: nil, status: :ok)
      DTOS::CommandResult.new(data: data, status: status)
    end
  end
end