# frozen_string_literal: true

# Washington plates:
# Passenger plates 1987 - 2009
# Passenger plates 2010 - present

module PlateValidator
  class WashingtonValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      return true if plate_serial.match(/\A\d{3}-?[A-HJ-NPR-Z][A-Z]{2}\Z/)
      return true if plate_serial.match(/\A[A-Z]{2}[A-HJ-NPR-Z]\d{4}\Z/)

      false
    end

  end
end