require_relative 'spec_helper.rb'

describe 'Admin class' do
  it 'can be initialized' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-05')
    a_test.must_be_instance_of Admin
    a_test.available_rooms(start_date,end_date)
  end

  it 'can reserve a single room' do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-05')
      a_test = Admin.new
      a_reservation = Reservation.new(1,start_date,end_date)
      a_test.reserve_room(a_reservation)
  end

  it 'can store/keep track of multiple reservation' do
  end

  it 'can look up a reservation' do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-10')
    searched_date = Date.parse('2001-02-7')
      a_test = Admin.new
      a_reservation = Reservation.new(1,start_date,end_date)
      a_test.reserve_room(a_reservation)
      a_test.look_up_reservation(searched_date)
  end

  it 'will return an array if multiple rooms are within date range' do
  end

  it 'will return the total cost for a reservation' do
    start_date = Date.parse('2001-03-03')
    end_date = Date.parse('2001-03-5')
    a_test = Admin.new
    a_reservation = Reservation.new(2,start_date,end_date)
    a_test.reserve_room(a_reservation)
    a_test.total_cost(a_test.all_reservations[0]).must_equal 200
  end

  # it 'will be my practice test' do
  #   a_test = Admin.new
  #   start_date = Date.parse('2001-02-03')
  #   end_date = Date.parse('2001-02-15')
  #   start_2 = Date.parse('2001-02-13')
  #   end_2 = Date.parse('2001-02-15')
  # #
  #   a_res = Reservation.new(3,start_date,end_date)
  #   a_res_2 = Reservation.new(3,start_2,end_2)
  # #   a_test.reserve_room(a_res)
  #   a_test.reserve_room(a_res_2)
  # #  a_test.available_rooms(start_date,end_date)
  #
  # end

### available ROOMS method ###

it 'will return all available rooms' do
  start_date = Date.parse('2001-03-03')
  end_date = Date.parse('2001-03-5')
  second_start = Date.parse('2002-03-5')
  second_end = Date.parse('2002-03-5')

  a_test = Admin.new

  a_reservation = Reservation.new(1,start_date,end_date)
  a_test.reserve_room(a_reservation)

  a_reservation = Reservation.new(2,second_start,second_end)
  a_test.reserve_room(a_reservation)

  a_test.available_rooms(start_date,end_date)
end
  it 'will return available rooms after a reservation' do
      a_test = Admin.new
      start_date = Date.parse('2001-02-03')
      end_date = Date.parse('2001-02-15')
      start_2 = Date.parse('2002-02-13')
      end_2 = Date.parse('2002-02-15')

      a_res = Reservation.new(3,start_date,end_date)
      a_res_2 = Reservation.new(7,start_2,end_2)

      a_test.reserve_room(a_res)
      a_test.reserve_room(a_res_2)

      a_test.available_rooms(start_date,end_2).wont_include 3
  end

  it 'will recognize available rooms if the same room is booked multiple times' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-05')

    start_2 = Date.parse('2001-02-06')
    end_2 = Date.parse('2001-02-10')

    searched_start_date = Date.parse('2001-02-01')
    searched_end_date = Date.parse('2001-02-09')

    a_res = Reservation.new(3,start_date,end_date)
    a_res_2 = Reservation.new(3,start_2,end_2)

    a_test.reserve_room(a_res)
    a_test.reserve_room(a_res_2)

    a_test.available_rooms(searched_start_date,searched_end_date).wont_include 3

  end

  it 'will return an empty array when all rooms are booked' do
      num_of_rooms = 20
      a_test = Admin.new
      start_date = Date.parse('2001-02-03')
      end_date = Date.parse('2001-02-15')

      num_of_rooms.times do
        a_test.reserve_room(Reservation.new(num_of_rooms,start_date,end_date))
        num_of_rooms-=1
      end

      a_test.available_rooms(start_date,end_date).must_equal []
  end

  # reserve_room tests ##
  it 'can reserve a room' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')

    a_test.reserve_room(Reservation.new((4),start_date,end_date))
    a_test.all_reservations[0].room_id.must_equal 4
    a_test.all_reservations[0].start_date.must_equal start_date
    a_test.all_reservations[0].end_date.must_equal end_date
  end

  it 'can reserve multiple rooms' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')


    a_test.reserve_room(Reservation.new(1,start_date,end_date))
    a_test.reserve_room(Reservation.new(13,start_date,end_date))
    a_test.reserve_room(Reservation.new(20,start_date,end_date))

    a_test.all_reservations[0].room_id.must_equal 1
    a_test.all_reservations[0].start_date.must_equal start_date
    a_test.all_reservations[0].end_date.must_equal end_date

    a_test.all_reservations[1].room_id.must_equal 13
    a_test.all_reservations[1].start_date.must_equal start_date
    a_test.all_reservations[1].end_date.must_equal end_date

    a_test.all_reservations[2].room_id.must_equal 20
    a_test.all_reservations[2].start_date.must_equal start_date
    a_test.all_reservations[2].end_date.must_equal end_date

    a_test.all_reservations.length.must_equal 3
  end

  it 'will raise an error if the date range of a reservation is not available' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')
    a_res = Reservation.new(1,start_date,end_date)

    a_test.reserve_room(a_res)
    proc{a_test.reserve_room(a_res)}.must_raise StandardError
  end

  it 'will allow an admin to reserve a room on a reserved end date' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')
    second_end = Date.parse('2001-03-15')
    a_res = Reservation.new(1,start_date,end_date)
    second_res = Reservation.new(1,end_date,second_end)

    a_test.reserve_room(a_res)
    a_test.reserve_room(second_res)
  end

  it 'will allow an admin to reserve a room if the reserverd end date is on a booked start date of the same room' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')

    second_start = Date.parse('2001-01-01')
    second_end = start_date
    a_res = Reservation.new(15,start_date,end_date)
    second_res = Reservation.new(15,second_start,second_end)

    a_test.reserve_room(a_res)
    a_test.reserve_room(second_res)
  end




end
