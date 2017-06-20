class LivingCreature
  include OpenHouse::Acceptor

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Animal < LivingCreature
end

class Plant < LivingCreature
end

class Mammal < Animal
end

class Reptile < Animal
end

class Dog < Mammal
  ACCEPTOR_TYPE_ID = :woof_woof
end

class Cat < Mammal
  ACCEPTOR_TYPE_ID = :meow_meow
end

class Bird < Reptile
end

class Canary < Bird
end

class Poodle < Dog
end
