# frozen_string_literal: true

# Utah plates:
# Passenger plates 1973 - 1985 (additional validation needed later)
# Passenger plates 1973 -
# Passenger plates 2007 - present

module PlateValidator
  class UtahValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      return true if plate_serial.match(/\A[A-HJ-NPR-Z]\d{2} ?[1-9][A-HJ-NPR-Z]{2}\Z/)
      return true if plate_serial.match(/\A[A-Z]{3} ?\d{3}\Z/)
      return true if plate_serial.match(/\A\d{3} ?[A-Z]{3}\Z/)

      return true if plate_serial.match(/\A[A-HJ-NPR-Z]\d{2} ?[1-9][A-HJ-NPR-Z]{2}\Z/)

      false
    end
  end
end
