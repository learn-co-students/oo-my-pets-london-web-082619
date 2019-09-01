class Owner

  @@all = [] 
  
  attr_reader :species, :name
  def initialize(name = nil, species = "human")
    @name = name
    @species = species
    @@all << self
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    @@all.count
  end 

  def self.reset_all
    @@all.clear
  end 

  def cats 
    Cat.all.select{|cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end 

  def buy_cat(new_cat)
  Cat.new(new_cat, self)
 end 

 def buy_dog(new_dog)
  Dog.new(new_dog, self)
 end 

  def walk_dogs 
    dogs.each{|dog| dog.mood = "happy"}
  end 

  def feed_cats 
    cats.each{|cat| cat.mood = "happy"}
  end 

  def sell_pets 
    cats.each{|cat| cat.owner = nil; cat.mood = "nervous"}
    dogs.each{|dog| dog.owner = nil; dog.mood = "nervous"}
  end 
  
  def list_pets 
   "I have #{dogs.count} dog(s), and #{cats.length} cat(s)."
  end
end