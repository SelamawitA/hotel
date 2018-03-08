require 'date'
class Reservation
  HOTEL_ROOM_COST_PER_NIGHT = 200
  attr_reader :room_id, :start_date, :end_date
  # an array of room objects will be created - dates will be assigned here

  def initialize(room_id,start_date,end_date)
    @room_id = room_id
    @start_date = start_date
    @end_date = end_date
    # condition to ensure date range is a positive number.
    if start_date > end_date
      raise StandardError.new('Start date must start before end date.')
    end

  end


  def cost
    date_range = (@end_date - @start_date).to_i
    if date_range.to_i == 1
      return HOTEL_ROOM_COST_PER_NIGHT
    else
      cost_of_trip = (date_range.to_i - 1)*HOTEL_ROOM_COST_PER_NIGHT

      return cost_of_trip
    end
  end

end
