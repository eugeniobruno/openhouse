require 'minitest_helper'

class TestAcceptVisitor < OpenHouse::Test
  def test_simplest_case
    some_animal = Animal.new('cool_animal_name')

    expected = 'This is an animal called cool_animal_name.'
    actual = some_animal.accept_visitor(visitor)

    assert_equal expected, actual
  end

  def test_explicit_acceptor_type_id
    some_dog = Dog.new('cool_dog_name')

    expected = 'This is a dog called cool_dog_name.'
    actual = some_dog.accept_visitor(visitor)

    assert_equal expected, actual
  end

  def test_undefined_implicit_method_in_visitor
    some_plant = Plant.new('cool_plant_name')
    assert_raises(NoMethodError) do
      some_plant.accept_visitor(visitor)
    end
  end

  def test_undefined_explicit_method_in_visitor
    some_cat = Cat.new('cool_cat_name')
    assert_raises(NoMethodError) do
      some_cat.accept_visitor(visitor)
    end
  end

  def test_with_valid_args
    some_reptile = Reptile.new('cool_reptile_name')

    expected = 'This is a reptile called cool_reptile_name. Args: first, second'
    actual = some_reptile.accept_visitor(visitor, 'first', 'second')

    assert_equal expected, actual
  end

  def test_with_invalid_args
    some_reptile = Reptile.new('cool_reptile_name')

    assert_raises(ArgumentError) do
      some_reptile.accept_visitor(visitor)
    end
  end
end
