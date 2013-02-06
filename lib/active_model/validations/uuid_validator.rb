require 'active_model'
require 'active_model/validator'

module ActiveModel
  module Validations
    class UuidValidator < ActiveModel::EachValidator
      RE = /\A[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}\z/i
      LOWER_UUID_RE = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/
      def initialize(options)
        super
        @uuid_regex = options[:lower] ? LOWER_UUID_RE : RE
      end

      def validate_each(record, attribute, value)
        record.errors.add(attribute, :not_an_uuid) unless value =~ @uuid_regex
      end

    end
  end
end
