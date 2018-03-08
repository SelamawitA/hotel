require 'pry'
class Admin
MAX_AVAILABILITY = 20
  attr_reader :all_rooms, :all_reservations

  def initialize
    @all_rooms = (1..20).to_a
    @all_reservations = []
  end
# this method should be a snapshot of available rooms. If, at the date requested, Room 3 exists. then it should print.
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
    #paseses tests - write them
    # if !(available_rooms(reservation.start_date,reservation.end_date).include? reservation.room_id)
    #   raise StandardError.new('Sorry, this room is already booked.')
    # end
    all_reservations.each do |a_res|
      if a_res.start_date == reservation.start_date || a_res.end_date == reservation.end_date
        raise StandardError.new('Room is booked during this period.')
      end
    end
    # incoming start date cannot equal any incoming start date
    # you already satisfy the condition. just make sure that for start date, you don't
    # check if the room_id start date is equivalent
    # all_reservations.each do |a_room|
    #   if a_room.room_id == reservation.room_id && reservation.start_date = room.start_date
    #     raise ArgumentError('')
    #
    # if reservation.start_date
      @all_reservations << reservation

end
  # def reserve_room(start_date,end_date,room_id)
  #   #create_all_rooms
  #   @all_rooms.each do |a_room|
  #     if a_room.room_number == room_id
  #     @all_reservations << Reservation.new(a_room,start_date,end_date)
  #      #Reservation.new(@all_rooms.sample,start_date,end_date)
  #    end
  #   end
  # end

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

## WAVE 2 ###
  # def available_rooms(start_date,end_date)
  #   all_available_rooms = all_rooms
  #   all_reservations.each do |reservation|
  #     #if the reservation exists in the array then delete
  #     if all_available_rooms.include?(reservation.room_id)
  #       all_available_rooms.delete(reservation.room_id)
  #     end
  #   end
  #   binding.pry
  #   return all_available_rooms
  # end


    # all_available_rooms = all_rooms
    # all_reservations.each do |reservation|
    #   all_available_rooms.each do |room|
    #     if room.room_number == reservation.room.room_number
    #       all_available_rooms.delete(room)
    #     end
    #   end
    # end

    # return all_available_rooms
    # all_available_rooms << all_reservations.detect{|res| res.room.room_number != room.room_number }
    #check if room is in reservations then skip.
      #  a.include?("b")
      #  if all_reservations.include()
       # (1..10).detect   { |i| i % 5 == 0 and i % 7 == 0 }

    ## ideas for a cleaner format ##
    # all_reserved_rooms = @all_reservations.select{|reservation| reservation.room}
    #
    # all_unreserved_rooms = all_rooms - all_reserved_rooms
  #   @all_reservations.each do |a_reservation|
  #     if !(a_reservation.start_date && a_reservation.end_date).between?(start_date,end_date)
  #       available_rooms << a_reservation.a_room
  #     end
  #   end
  #   return available_rooms
  # end

  #why would you want to reserve a room that's already booked?
  # def reserve_available_room(start_date,end_date)
  #   current_available_rooms = available_rooms(start_date,end_date)
  #   #make a reservation
  #   # i
  #   all_reservations << Reservation.new(current_available_rooms.sample,start_date,end_date)
  #
  # end
