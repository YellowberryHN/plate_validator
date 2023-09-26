# frozen_string_literal: true

require_relative "plate_validator/version"
Dir[File.join(__dir__, "plate_validator", "validators", "*.rb")].sort.each do |file|
  require file unless file.start_with?("_")
end

module PlateValidator
  class Error < StandardError; end

  def self.from_sym(location)
    class_name = "#{location.to_s.split("_").map(&:capitalize).join}Validator"
    validator_class = PlateValidator.const_get(class_name) if PlateValidator.const_defined?(class_name)

    raise ArgumentError, "invalid location: #{location}" if validator_class.nil?

    validator_class
  end
end
