# frozen_string_literal: true

# Colorado plates:
# Passenger plates 2000 - 2015
# Passenger plates 2015 - 2018
# Passenger plates 2018 - present

module PlateValidator
  class ColoradoValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      return true if plate_serial.match(/\A[A-Z]{3}-?[A-Z]\d{2}\Z/) # 2018 - present
      return true if plate_serial.match(/\A[A-Z]{3}-?\d{3}\Z/) # 2015 - 2018
      return true if plate_serial.match(/\A\d{3}-?[A-Z]{3}\Z/) # 2000 - 2015

      false
    end
  end
end
