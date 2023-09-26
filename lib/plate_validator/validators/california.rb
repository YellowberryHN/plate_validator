# frozen_string_literal: true

# California plates:
# Passenger plates 1963 - 1969
# Passenger plates 1969 - 1980
# Passenger plates 1980 - present

module PlateValidator
  class CaliforniaValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      if plate_serial.match(/\A[1-9][A-HJ-NPR-Z][A-Z][A-HJ-NPR-Z]\d{3}\Z/) # (P) 1980 - present
        return false if plate_serial.match(/\A1(?:S[W-Z][D-HJ-NPR-Z]|T[A-Z][A-HJ-NPR-Z])\d{3}\Z/) # 1SWD-1TZZ Unissued
        return false if plate_serial.match(/\A1[W-Y][A-Z][A-HJ-NPR-Z]\d{3}\Z/) # 1WAA-1YZZ Unissued
        return false if plate_serial.match(/\A3F[M-Z][HJ-NPR-Z]\d{3}\Z/) # 3FMH-3FZZ Unissued
        return false if plate_serial.match(/\A3(?:Y[A-Z]|Z[A-Y])[A-HJ-NPR-Z]\d{3}\Z/) # 3YAA-3ZYZ Unissued

        return true
      end
      return true if plate_serial.match(/\A[A-Z]{3} ?\d{3}\Z/) # 1963 - 1969
      return true if plate_serial.match(/\A\d{3} ?[A-HJ-NPR-Z][A-Z]{2}\Z/) # 1969 - 1980

      false
    end
  end
end

