require_relative 'spec_helper.rb'

describe 'Room class' do
  it 'can be instantiated' do
    room_test = Room.new(1)
    room_test.must_be_instance_of Room
  end
  it 'has functioning attr_readers' do
    room_test = Room.new(1)
    room_test.room_number.must_equal 1
  end
  it 'has a functioning assign_room_number method' do
    room_test = Room.new(1)
    room_test.assign_room_number(4)
    room_test.room_number.must_equal 4
  end
end
