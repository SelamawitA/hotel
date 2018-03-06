require 'date'
class Reservation
  HOTEL_ROOM_COST_PER_NIGHT = 200
  attr_reader :a_room, :start_date, :end_date
  # an array of room objects will be created - dates will be assigned here

  def initialize(a_room,start_date,end_date)
    @room = a_room
    @start_date = start_date
    @end_date = end_date
  end

  def cost
    if @end_date - @start_date == 1
      return HOTEL_ROOM_COST_PER_NIGHT
    else
      cost_of_trip = (@end_date - @start_date - 1)*HOTEL_ROOM_COST_PER_NIGHT

      return cost_of_trip
    end
  end

end
