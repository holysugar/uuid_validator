require 'minitest/spec'
require 'minitest/autorun'

require 'active_model'
require 'uuid_validator'

class TestModel
  include ActiveModel::Validations
  attr_accessor :key

  def initialize(options = {})
    @key = options[:key]
  end
end

