require_relative "room"

class Hotel
  def initialize(name,hash)
    @name = name
    @rooms = hash
  end

  def name
    @name.capitalize
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    if @rooms.has_key?(room_name)
        return true
    else
        return false
    end
  end

  def check_in(person,room_name)
    if !self.room_exists?(room_name)
        print 'sorry, room does not exist'
    else
        self.add_occupant(room_name)
        


end
