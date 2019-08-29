require_relative './dog'
require_relative './cat'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name=nil)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats
    owners_cats = []
    Cat.all.each do |cat|
      if cat.owner == self
        owners_cats << cat
      end  
    end  
    owners_cats
  end

  def dogs
    owners_dogs = []
    Dog.all.each do |dog|
      if dog.owner == self
        owners_dogs << dog
      end  
    end  
    owners_dogs
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = cats.concat(dogs)
    pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end





end