require 'pry'
class Admin
MAX_AVAILABILITY = 20
  attr_reader :all_rooms, :all_reservations

  def initialize
    @all_rooms = (1..20).to_a
    @all_reservations = []
  end

  def available_rooms(start_date,end_date)
    all_available_rooms = all_rooms
    all_reservations.each do |reservation|
        if reservation.start_date == start_date && reservation.end_date == end_date
           all_available_rooms.delete(reservation.room_id)
        end
    end
      return all_available_rooms
  end


  def reserve_room(reservation)
    all_reservations.each do |a_res|
      if a_res.start_date == reservation.start_date || a_res.end_date == reservation.end_date
        raise StandardError.new('Room is booked during this period.')
      end
    end

      @all_reservations << reservation
   end

   def look_up_reservation(date)
     searched_reservations = []
     @all_reservations.each do |a_reservation|
       if date.between?(a_reservation.start_date, a_reservation.end_date)
         searched_reservations << a_reservation
       end
     end
     return searched_reservations
     end

   def total_cost(reservation)
     #update input to be room id?
     @all_reservations.each do |a_reservation|
       if a_reservation.start_date == reservation.start_date && a_reservation.end_date == reservation.end_date
         return a_reservation.cost
       end
     end
   end


end
