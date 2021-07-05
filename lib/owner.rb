class Owner

attr_accessor 
attr_reader :name , :species 

@@all = []

  def initialize (name, specie)
    @name = name
    @species = human
    @@all << self
  end 
  
  def say_species
  "I am a #{self.species}."
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
  Cat.all.select { |cat| cat.owner == self }
  
end

def dogs 
   Dog.all.select { |dog| dog.owner == self }
end

def buy_cat(name)
  Cat.new(name, self)
end
  
def buy_dog(name) 
  
  Dog.new(name,self)
end

def walks_dogs
  
  Dog.each { |dog| dog.mood = "happy" }

end
  
end 