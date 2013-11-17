
#a Struct is a special class whose only job is to have attributes and to hold data

##Person = Struct.new(:name, :gender, :age)
#the first line is equivalent to this longhand method
#(class Person
#  attr_accessor :name, :gender, :age

#  def initialize(name, gender, age)
#    @name = name
#    @gender = gender
#    @age = age
#  end
#end)

##fred = Person.new("Fred", "male", 50)
#chris = Person.new("Chris", "male", 25)
#puts fred.age + chris.age

#using a struct tech is a quicker to type and eaiser to read, although if you utimately want to add some
#more functionality to the class, creating a class the long way is worth the effort.

#however, the good thing is that you can start out with a struct and recode it into a full class when you're ready
class Dungeon
  attr_accessor :player

  def initialize(play_name)
    @player = Player.new(play_name)
    @rooms = []
  end

#  Player = Struct.new(:name, :location)
# Room = Struct.new(:reference, :name, :description, :connections)

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect{|room| room.reference == reference}
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go" + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
     @name + "\n\nYou are in " + @description
    end
  end
end

#create the main dungeon object
my_dungeon = Dungeon.new("Fred Bloggs")

#add rooms to the dungeon
my_dungeon.add_room(:largecave, "Large Cave", "a Large cavernous cave", {:west => :smallcave})
my_dungeon.add_room(:smallcave, "Small Cave", "a small. claustrophobic cave", {:east => :largecave})

#start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)

#if you ever need to add methods to Player or Room, you can rewrite the as classes
#and add the attributes back wit attr_accessor.



