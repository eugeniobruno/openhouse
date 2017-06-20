class BiosphereVisitor
  def visit_animal(animal)
    "This is an animal called #{animal.name}."
  end

  def visit_reptile(reptile, arg1, arg2)
    "This is a reptile called #{reptile.name}. Args: #{arg1}, #{arg2}"
  end

  def visit_bird(bird)
    "This is a bird called #{bird.name}."
  end

  def visit_woof_woof(dog)
    "This is a dog called #{dog.name}."
  end

  def visit_cat(cat)
    "This is a cat called #{cat.name}"
  end
end
