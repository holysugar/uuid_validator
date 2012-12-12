require 'active_model'
require 'active_model/validator'

module ActiveModel
  module Validations
    class UuidValidator < ActiveModel::EachValidator
      RE = /\A[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}\z/i

      def validate_each(record, attribute, value)
        record.errors.add(attribute, :not_an_uuid) unless value =~ RE
      end

    end
  end
end
