class Admin
MAX_AVAILABILITY = 20
  attr_reader :all_rooms
  def initialize
    @all_rooms = {}
  end
  #create an array of 20 room objects ( check)
  def create_all_rooms
    room_id = 1
    MAX_AVAILABILITY.times do
    @all_rooms[Room.new(room_id)] = nil
    room_id+=1
    end
  end

  def reserve_room(begin_date,end_date,room)
    #do dates need to be instance variables?
    # Reservation.new()


  end

  def total_cost
    #look up by a specific hotel room ID and use reservation to return cost of reservation.
  end

  def look_up_reservation
    #look up by start_date, if end date matches as well # then return.
  end

end
