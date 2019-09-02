require "pry"

require_relative "dog.rb"
require_relative "cat.rb"

class Dog

    attr_accessor :owner, :mood
    attr_reader :name

    @@all = []

    def initialize(name, owner)
      @name = name
      @owner = owner
      @mood = "nervous"
      @@all << self
    end

    def self.all
      @@all
    end

    def mood
      @mood
    end

  end