# frozen_string_literal: true

# Oregon plates:
# Passenger plates 1955 - 1963
# Passenger plates 1964 - present

module PlateValidator
  class OregonValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      return true if plate_serial.match(/\A[1-9][A-HJ-MNP-Z]-?\d{4}\Z/)
      return true if plate_serial.match(/\A[A-Z]{3} ?\d{3}\Z/)
      return true if plate_serial.match(/\A\d{3} ?[B-Z]{3}\Z/)

      false
    end
  end
end