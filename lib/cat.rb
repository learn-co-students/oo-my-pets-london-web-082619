require_relative './owner'


class Cat

  @@all = []

  attr_reader :name, :owner
  attr_accessor :mood

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def owner=(new_owner)
    @owner = new_owner
  end

end