# frozen_string_literal: true

# Idaho plates:
# TODO: provide descriptions of the plates covered

module PlateValidator
  class IdahoValidator
    def valid?(plate_serial)
      raise ArgumentError, "plate serial not specified" if plate_serial.nil? || plate_serial.empty?

      # this plate is so unnecessarily complicated to make a regex for
      return true if plate_serial.match(/[EIKNSVW] ?\d{5,6}/)
      return true if plate_serial.match(/K [A-Z]\d{4}U/)
      return true if plate_serial.match(%r{10/?B ?(?:\d{4}|[A-Z]\d{3})})
      return true if plate_serial.match(%r{1/?A ?(?:\d{4}[A-Z]|\d{3}[A-Z]{2})})
      return true if plate_serial.match(%r{(?:[1-9]/?B|[1-7]/?C|[1-4]/?L|[1-2]/?[AFGJMOPT]) ?(?:\d{5}|[A-Z]\d{4}|[A-Z]{2}\d{3}|\d[A-Z]\d{3})})

      return true if plate_serial.match(/K [A-Z]{2}\d{3}U/)
      return true if plate_serial.match(/[EIKNSVW] ?(?:\d{4}|[A-Z]\d{3})U/)
      return true if plate_serial.match(%r{10/?B ?\d{3}U})
      return true if plate_serial.match(%r{1/?A ?(?:[A-Z]{2}\d{2}|[A-Z]{3}\d)U})
      return true if plate_serial.match(%r{(?:[1-9]/?B|[1-7]/?C|[1-4]/?L|[1-2]/?[AFGJMOPT]) ?(?:\d{4}|[A-Z]\d{3})U})

      false
    end
  end
end
