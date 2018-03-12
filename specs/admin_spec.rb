require_relative 'spec_helper.rb'

describe 'Admin class' do
  it 'can be initialized' do
    a_test = Admin.new
    a_test.must_be_instance_of Admin
  end

  it 'can display a list of all rooms in the hotel' do
    a_test = Admin.new
    a_test.all_rooms.must_equal (1..20).to_a
  end

  it 'can access all reservations' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-05')

    second_start = Date.parse('1993-03-03')
    second_end = Date.parse('1993-03-05')
    a_test.reserve_room(Reservation.new(1,start_date,end_date))
    a_test.reserve_room(Reservation.new(20,second_start,second_end))
    a_test.all_reservations.length.must_equal 2

    a_test.all_reservations[0].room_id.must_equal 1
    a_test.all_reservations[1].room_id.must_equal 20

    a_test.all_reservations[0].start_date.must_equal start_date
    a_test.all_reservations[0].end_date.must_equal end_date

    a_test.all_reservations[1].start_date.must_equal second_start
    a_test.all_reservations[1].end_date.must_equal second_end

  end

  it 'can look up a reservation' do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-10')
    searched_date = Date.parse('2001-02-7')
    a_test = Admin.new
    a_reservation = Reservation.new(1,start_date,end_date)
    a_test.reserve_room(a_reservation)
    a_test.look_up_reservation(searched_date)[0].must_equal a_reservation
  end

  it 'will return an array if multiple rooms are within date range' do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-10')
    searched_date = Date.parse('2001-02-7')
    a_test = Admin.new
    a_reservation = Reservation.new(1,start_date,end_date)
    second_res = Reservation.new(20,start_date,end_date)
    a_test.reserve_room(a_reservation)
    a_test.reserve_room(second_res)
    a_test.look_up_reservation(searched_date)[0].must_equal a_reservation
    a_test.look_up_reservation(searched_date)[1].must_equal second_res
  end

  it 'will return the total cost for a reservation' do
    start_date = Date.parse('2001-03-03')
    end_date = Date.parse('2001-03-5')
    a_test = Admin.new
    a_reservation = Reservation.new(2,start_date,end_date)
    a_test.reserve_room(a_reservation)
    a_test.total_cost(a_test.all_reservations[0]).must_equal 200
  end

  ### available ROOMS method ###

  it 'will return all available rooms' do
    a_test = Admin.new
    start_date = Date.parse('2001-03-03')
    end_date = Date.parse('2001-03-5')
    a_test.available_rooms(start_date,end_date).must_equal (1..20).to_a
  end

  it 'will return available rooms after a reservation' do
    start_date = Date.parse('2001-03-03')
    end_date = Date.parse('2001-03-5')
    second_start = Date.parse('2001-03-10')
    second_end = Date.parse('2001-03-12')

    searched_start = Date.parse('2001-03-03')
    searched_end = Date.parse('2001-03-12')

    a_test = Admin.new

    a_res = Reservation.new(1,start_date,end_date)
    a_test.reserve_room(a_res)

    second_res= Reservation.new(2,second_start,second_end)
    a_test.reserve_room(second_res)

    a_test.available_rooms(searched_start,searched_end).must_equal (3..20).to_a
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

  it 'will raise an error for a room outside of range' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')
    a_res = Reservation.new(0,start_date,end_date)
    proc{a_test.reserve_room(a_res)}.must_raise StandardError

    a_test_neg = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')
    a_res_neg = Reservation.new(-1,start_date,end_date)
    proc{a_test.reserve_room(a_res_neg)}.must_raise StandardError

    a_test_over = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')
    a_res_over = Reservation.new(21,start_date,end_date)
    proc{a_test.reserve_room(a_res_over)}.must_raise StandardError
  end

  it 'will raise an error if the date range of a reservation is not available' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')
    a_res = Reservation.new(1,start_date,end_date)

    a_test.reserve_room(a_res)
    proc{a_test.reserve_room(a_res)}.must_raise StandardError
  end

  it 'will raise an error if a reservation is made on a booked start date' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')

    second_start = start_date
    second_end = Date.parse('2003-02-15')

    a_res = Reservation.new(11,start_date,end_date)
    a_second_res = Reservation.new(11,second_start,second_end)

    a_test.reserve_room(a_res)
    proc{a_test.reserve_room(a_second_res)}.must_raise StandardError
  end

  it 'will raise an error if a reservations end date matches a booked end date' do
    a_test = Admin.new
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')

    second_start = Date.parse('2000-02-11')
    second_end = end_date

    a_res = Reservation.new(13,start_date,end_date)
    a_second_res = Reservation.new(13,second_start,second_end)

    a_test.reserve_room(a_res)
    proc{a_test.reserve_room(a_second_res)}.must_raise StandardError
  end

  it 'will allow an admin to have a reserve start date on a booked reserved end date' do
    a_test = Admin.new

    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-15')

    second_end = Date.parse('2001-03-15')

    a_res = Reservation.new(1,start_date,end_date)
    second_res = Reservation.new(1,end_date,second_end)

    a_test.reserve_room(a_res)
    a_test.reserve_room(second_res)
    a_test.all_reservations.length.must_equal 2
    a_test.all_reservations[0].must_equal a_res
    a_test.all_reservations[1].must_equal second_res
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

    a_test.all_reservations.length.must_equal 2
    a_test.all_reservations[0].must_equal a_res
    a_test.all_reservations[1].must_equal second_res
  end

end
