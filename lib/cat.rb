require_relative "./owner.rb"
require_relative "./dog.rb"
class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []
  def initialize(name, owner, mood="nervous")
    @name = name
     @owner = owner
     @mood = mood
     @@all << self
  end
  def self.all
      @@all
    end

end