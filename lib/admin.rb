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
      if (start_date+1).between?(reservation.start_date,reservation.end_date) || (end_date-1).between?(reservation.start_date,reservation.end_date)
           all_available_rooms.delete(reservation.room_id)
        end
    end
      return all_available_rooms
  end

  def reserve_room(reservation)
    if all_rooms.include?(reservation.room_id) == nil
      raise StandardError.new("Room #{reservation.room_id} is outside of acceptable hotel room range. Input a hotel room with an ID 1-20.")
    end

    current_available_rooms = available_rooms(reservation.start_date,reservation.end_date)
    if current_available_rooms.detect {|room| room == reservation.room_id} == nil
      raise StandardError.new("Room #{reservation.room_id} is booked during this period.")
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
     @all_reservations.each do |a_reservation|
       if a_reservation.start_date == reservation.start_date && a_reservation.end_date == reservation.end_date
         return a_reservation.cost
       end
     end
   end


end
