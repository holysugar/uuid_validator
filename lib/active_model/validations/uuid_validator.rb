require 'active_model'
require 'active_model/validator'

module ActiveModel
  module Validations
    class UuidValidator < ActiveModel::EachValidator
      RE_STRING = "[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}"

      def initialize(options)
        super
        @re = case
              when options[:upper_only]
                /\A#{RE_STRING.upcase}\z/
              when options[:lower_only]
                /\A#{RE_STRING.downcase}\z/
              else
                /\A#{RE_STRING}\z/i
              end
      end

      def validate_each(record, attribute, value)
        record.errors.add(attribute, :not_an_uuid) unless value =~ @re
      end

    end
  end
end
