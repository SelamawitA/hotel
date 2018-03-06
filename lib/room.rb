class Room
  #can be assigned and return a room number
  attr_reader :room_number

  def initialize(a_room_num)
    @room_number = a_room_num
  end

  def assign_room_number(a_room_number)
    if !room_number.between?(1,20)
      raise StandardError.new("Room number must be between 1-20.")
    end
    @room_number = a_room_number
  end

end
