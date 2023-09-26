# frozen_string_literal: true

# Maryland plates:
# Passenger plates 1970 - 1975
# Passenger plates 1975 - 2004
# Passenger plates 2004 - 2010
# Passenger plates 2010 - 2016
# Passenger plates 2016 - present

module PlateValidator
  class MarylandValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      # TODO: I'm not happy with the accuracy of this, too many false positives, revisit later
      return true if plate_serial.match(/\A[A-HJ-NPR-TV-Z]{2} ?(?:100[1-9]|10[1-9]\d|1[1-9]\d{2}|[2-9]\d{3})\Z/)
      return true if plate_serial.match(/\A[A-HJ-NPR-TV-Z]{3} ?(?:00[1-9]|0[1-9]\d|[1-9]\d{2})\Z/)
      return true if plate_serial.match(/\A[1-9][A-HJ-NPR-TV-Z]{2} ?[A-HJ-NPR-TV-Z](?:0[1-9]|[1-9]\d)\Z/)
      return true if plate_serial.match(%r{\A[1-9][A-HJ-NPR-TV-Z]/?[A-HJ-NPR-TV-Z]\d{4}\Z})

      false
    end
  end
end
