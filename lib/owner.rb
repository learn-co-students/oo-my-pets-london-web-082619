
require_relative "../lib/cat.rb"
require_relative "./dog.rb"

require "pry"
class Owner
  attr_reader :name, :species
  @@all =[]
 def initialize(name)
  @name = name
   @species = "human"
    @@all << self
 end
 def say_species
  "I am a #{@species}."
 end
 def self.all
     @@all
   end
   def self.count
    @@all.length
    
   end
   def self.reset_all
    @@all.clear
   end
   def cats
    Cat.all.select {
       |cat| self == cat.owner
    }
   #  binding.pry
   end
   def dogs
     Dog.all.select {|dog| self == dog.owner}
end
def buy_cat(name)
   new_cat = Cat.new(name, self)
end
def buy_dog(name)
   new_cat = Dog.new(name, self)
end
def walk_dogs
   Dog.all.each do |moods|
      if moods.mood == "nervous"
         moods.mood = "happy"
      end
# binding.pry
end
end
def feed_cats
   Cat.all.each{|moods| moods.mood = "happy"}
end
def sell_pets
   dogs = Dog.all.select{|dog| dog.owner == self}
   dogs.each{|dog| dog.mood = "nervous" ; dog.owner = nil}
   cats = Cat.all.select{|cat| cat.owner == self}
   cats.each{|cat| cat.mood = "nervous" ; cat.owner = nil}
end
   def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
   end
end
#  binding.pry