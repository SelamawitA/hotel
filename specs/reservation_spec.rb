
require_relative 'spec_helper.rb'
require 'date'


describe "Reservation class" do
  it "can be instantiated" do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-05')

    test_reservation =Reservation.new(1,start_date,end_date)
    test_reservation.must_be_instance_of Reservation
  end

  it "can calculate and return the cost of a reservation for a single day" do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-04')

    test_reservation = Reservation.new(1,start_date,end_date)
    test_reservation.cost.must_equal 200
  end

  it "can calculate and return cost for an extended trip." do
    start_date = Date.parse('2001-02-03')
    end_date = Date.parse('2001-02-14')

    test_reservation = Reservation.new(1,start_date,end_date)
    test_reservation.cost.must_equal 2000
  end

  #consider moving outside of the constructor because it is a StandardError?
  it 'will thrown a StandardError for an invalid date range' do
    start_date = Date.parse('2001-02-13')
    end_date = Date.parse('2001-02-04')
    proc { Reservation.new(1,start_date,end_date) }.must_raise StandardError
  end

  it 'will raise a StandardError if start date is instantiated with a non-date object' do
    start_date = 2001-02-13
    end_date = Date.parse('2001-02-04')
    proc { Reservation.new(1,start_date,end_date) }.must_raise StandardError
  end

  it 'will raise a StandardError if instantiated with a non-date object' do
    start_date = Date.parse('2001-02-13')
    end_date = 2001-02-04
    proc { Reservation.new(1,start_date,end_date) }.must_raise StandardError
  end

end
