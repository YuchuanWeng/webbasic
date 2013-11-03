
#a Struct is a special class whose only job is to have attributes and to hold data

Person = Struct.new(:name, :gender, :age)
#the first line is equivalent to this long hand method
#(class Person
#  attr_accessor :name, :gender, :age

#  def initialize(name, gender, age)
#    @name = name
#    @gender = gender
#    @age = age
#  end
#end)

fred = Person.new("Fred", "male", 50)
chris = Person.new("Chris", "male", 25)
puts fred.age + chris.age
