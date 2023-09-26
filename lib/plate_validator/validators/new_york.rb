# frozen_string_literal: true

# New York plates:
# TODO: provide descriptions of the plates covered

module PlateValidator
  class NewYorkValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      # TODO: add the logic for the location
      return true if plate_serial.match(/\A\d{3,4}-?[A-Z]{3}\Z/)
      return true if plate_serial.match(/\A\d[A-Z]{2} ?\d{3}\Z/)
      return true if plate_serial.match(/\A[A-Z]{2}\d ?\d{2}[A-Z]\Z/)
      return true if plate_serial.match(/\A[A-HJ-NPR-Z]{3}-?\d{4}\Z/)

      false
    end
  end
end
