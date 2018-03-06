require_relative 'spec_helper.rb'

describe 'Admin class' do
  it 'can be initialized' do
    a_test = Admin.new
    a_test.must_be_instance_of Admin
  end
  it 'has functioning access to all rooms' do
    a_test = Admin.new
    a_test.create_all_rooms
    a_test.all_rooms.must_be_instance_of Hash
  end

  it 'will assign rooms with IDs 1-20' do
    a_test = Admin.new
    a_test.create_all_rooms
    test_ID = 1
    room_IDs = a_test.all_rooms.keys
    room_IDs.each do |room|
      room.room_number.must_equal test_ID
      test_ID+=1
    end
  end

end
