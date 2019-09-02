require "pry"
class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.each {|owners| owners.name}.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    #Need to go into all the cats, compare it to owner and return all the cats that belong to an owner
    Cat.all.select{ |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{ |dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    cats = Cat.all.select do |cat|
      cat.owner == self
    end

    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    
    dogs = Dog.all.select do |dog|
      dog.owner == self
    end 

    dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
      
end