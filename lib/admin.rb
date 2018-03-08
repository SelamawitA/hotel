require 'pry'
class Admin
MAX_AVAILABILITY = 20
  attr_reader :all_rooms, :all_reservations

  def initialize
    @all_rooms = (1..20).to_a
    @all_reservations = []
  end


  def reserve_room(reservation)
    all_reservations.each do |a_res|
      if a_res.start_date == reservation.start_date || a_res.end_date == reservation.end_date
        raise StandardError.new('Room is booked during this period.')
      end
    end

      @all_reservations << reservation

   end



end
