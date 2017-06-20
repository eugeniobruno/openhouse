require 'openhouse/version'

require 'openhouse/simple_inflector'
require 'openhouse/acceptor'

module OpenHouse
  def self.simple_inflector
    @simple_inflector ||= SimpleInflector.new
  end
end
