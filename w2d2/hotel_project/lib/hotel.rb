require_relative "room"

class Hotel
  def initialize(name,hash)
    @name = name
    @rooms = {}
    hash.each do |key,value|
      @rooms[key] = Room.new(value)
    end
  end


  def name
    @name.split.map(&:capitalize).join(" ")
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
      if @rooms[room_name].add_occupant(person)
        print 'check in successful'
      else
        print 'sorry, room is full'
      end
    end
  end

  def has_vacancy?
    @rooms.each do |k,v|
      if !@rooms[k].full?
        return true
      end
    end
    return false
  end

  def list_rooms
    @rooms.each do |k,v|
      puts "#{k} : #{v.available_space}"
    end
  end
end
