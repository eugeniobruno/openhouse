require 'coverage_helper'
require 'minitest/autorun'
require 'minitest/bender'
require 'pry-byebug'
require 'openhouse'

require 'examples/biosphere'
require 'examples/biosphere_visitor'

module OpenHouse
  class Test < Minitest::Test
    def visitor
      BiosphereVisitor.new
    end
  end
end
