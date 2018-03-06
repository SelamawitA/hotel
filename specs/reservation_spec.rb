
require_relative 'spec_helper.rb'
require 'date'


describe "Reservation class" do
  it "can be instantiated" do
    a_room = Room.new(1)
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-05')

    test_reservation =Reservation.new(a_room,start_date,end_date)
    test_reservation.must_be_instance_of Reservation
  end

  it "can calculate and return the cost of a reservation for a single day" do
    a_room = Room.new(1)
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-04')

    test_reservation =Reservation.new(a_room,start_date,end_date)
    test_reservation.cost.must_equal 200
  end

  it "can calculate and return cost for an extended trip." do
    a_room = Room.new(1)
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-14')

    test_reservation =Reservation.new(a_room,start_date,end_date)
    test_reservation.cost.must_equal 2000
  end

end
