# require 'pry'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count #Owner.count
    return @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    return "I am a #{@species}."
  end
  
  #ASSOCIATION METHODS

  def cats #owner.cats
    #returns a a collection of all the cats that belong to the owner
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs #owner.dogs
    #returns a a collection of all the dogs that belong to the owner
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.select { |dog| dog.owner == self }.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.select{ |cat| cat.owner == self }.each{ |cat| cat.mood = "happy"}
  end

  def sell_pets
    #make them nervous
    Cat.all.select{ |cat| cat.owner == self }.each{ |cat| cat.mood = "nervous"}
    Dog.all.select { |dog| dog.owner == self }.each { |dog| dog.mood = "nervous"}
    #set owner to nil
    Cat.all.select{ |cat| cat.owner == self }.each{ |cat| cat.owner = nil}
    Dog.all.select{ |dog| dog.owner == self }.each{ |dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# binding.pry
# 'save'