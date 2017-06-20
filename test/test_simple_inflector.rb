require 'minitest_helper'

class TestSimpleInflector < OpenHouse::Test
  def test_demodulized
    expected = 'MyModuleName'
    actual = simple_inflector.demodulized(full_namespace)

    assert_equal expected, actual
  end

  def test_underscored1
    expected = 'my_module_name'
    actual = simple_inflector.underscored('MyModuleName')

    assert_equal expected, actual
  end

  def test_underscored2
    expected = 'my_a_name'
    actual = simple_inflector.underscored('MyAName')

    assert_equal expected, actual
  end

  def test_underscored3
    expected = 'my_abc_name'
    actual = simple_inflector.underscored('MyABCName')

    assert_equal expected, actual
  end

  def test_underscored4
    expected = 'abc_name'
    actual = simple_inflector.underscored('ABCName')

    assert_equal expected, actual
  end

  def test_underscored5
    expected = 'abc_name_mno_more'
    actual = simple_inflector.underscored('ABCNameMNOMore')

    assert_equal expected, actual
  end

  def test_underscored6
    expected = 'abc_name_mno_more_xyz'
    actual = simple_inflector.underscored('ABCNameMNOMoreXYZ')

    assert_equal expected, actual
  end

  def test_underscored7
    expected = 'a'
    actual = simple_inflector.underscored('A')

    assert_equal expected, actual
  end

  def test_underscored8
    expected = 'ab'
    actual = simple_inflector.underscored('AB')

    assert_equal expected, actual
  end

  def test_underscored_demodulized
    expected = 'my_module_name'
    actual = simple_inflector.underscored_demodulized(full_namespace)

    assert_equal expected, actual
  end

  private

  def simple_inflector
    OpenHouse.simple_inflector
  end

  def full_namespace
    'MyGem::MyNamespace::MyModuleName'
  end
end
