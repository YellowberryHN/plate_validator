# frozen_string_literal: true

# LOCATION plates:
# TODO: provide descriptions of the plates covered

module PlateValidator
  class LocationValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      # TODO: add the logic for the location
      # return true if plate_serial.match(/\A[A-Z]{3} ?\d{3}\Z/)

      false
    end
  end
end
