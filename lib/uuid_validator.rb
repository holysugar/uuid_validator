require 'active_model/validations/uuid_validator'
require "uuid_validator/version"

module UuidValidator
end

I18n.load_path += Dir[File.expand_path(File.dirname(__FILE__) + '/active_model/locale/*.yml')]
