require "pry"

require_relative "dog.rb"
require_relative "cat.rb"

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

    def say_species
      "I am a human."
    end

    def self.count
      @@all.length
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.select{|cat_ins| cat_ins.owner == self}
    end

    def dogs
      Dog.all.select{|dog_ins| dog_ins.owner == self}
    end

    def buy_cat(name)
        Cat.new(name, self)
    end

    def buy_dog(name)
        Dog.new(name,self)
    end

    def walk_dogs
      dogs.each {|d| d.mood=("happy")}
    end
    
    def feed_cats
      cats.each {|c| c.mood=("happy")}
    end

    def sell_pets
      dogs.each {|d| d.mood=("nervous")}
      dogs.each {|d| d.owner=nil}
      cats.each {|c| c.mood=("nervous")}
      cats.each {|c| c.owner=nil}
    end

    def list_pets
      "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
    end

end
       