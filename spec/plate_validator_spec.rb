# frozen_string_literal: true

# NOTE: Test plate serials are sometimes silly and corny. Please humour me.
# Other times they are taken from Wikipedia example photos.

RSpec.describe PlateValidator do
  it "has a version number" do
    expect(PlateValidator::VERSION).not_to be nil
  end

  it "returns the correct validator" do
    expect(PlateValidator.from_sym(:california)).to be PlateValidator::CaliforniaValidator
    expect(PlateValidator.from_sym(:utah)).to be PlateValidator::UtahValidator
    expect(PlateValidator.from_sym(:new_york)).to be PlateValidator::NewYorkValidator
    expect(PlateValidator.from_sym(:california)).not_to be PlateValidator::UtahValidator
  end

  it "raises an exception for an invalid location" do
    expect{ PlateValidator.from_sym(:antarctica) }.to raise_error(/\Ainvalid location/)
  end
end

RSpec.shared_examples "a plate validator" do
  it { is_expected.to respond_to(:valid?).with(1).argument }
  it { is_expected.not_to respond_to(:valid?).with(0).arguments }

  before { @validator = described_class.new }

  describe "#valid?" do

    it "raises an exception if plate serial is blank" do
      expect { @validator.valid?("") }.to raise_error("plate serial not specified")
    end

    it "raises an exception if plate serial is nil" do
      expect { @validator.valid?(nil) }.to raise_error("plate serial not specified")
    end

    it "raises an exception if plate serial is not specified" do
      expect { @validator.valid? }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe PlateValidator::CaliforniaValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "1ABC123", valid: true },
    { plate: "1ABI123", valid: false },
    { plate: "3YYY023", valid: false },
    { plate: "1SZZ123", valid: false },
    { plate: "1SWC999", valid: true },
    { plate: "1UAA000", valid: true },
    { plate: "SAM 123", valid: true },
    { plate: "455 IAZ", valid: false },
    { plate: "123 SAM", valid: true },
    { plate: "079OGG", valid: false },
    { plate: "711GAS", valid: true },
    { plate: "3FML666", valid: false },
    { plate: "3HEY570", valid: true }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end

RSpec.describe PlateValidator::ColoradoValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "ABC-123", valid: true },
    { plate: "987-XYZ", valid: true },
    { plate: "DOG-D99", valid: true },
    { plate: "ASD990", valid: true }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end

RSpec.describe PlateValidator::IdahoValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "1/A 68507", valid: true },
    { plate: "8/B 40113", valid: true },
    { plate: "1/L 21910", valid: true },
    { plate: "8/B 58507", valid: true },
    { plate: "1G 80214", valid: true },
    { plate: "1A LU987", valid: true },
    { plate: "2T M953U", valid: true },
    { plate: "K 82424", valid: true },
    { plate: "5B A1102", valid: true },
    { plate: "8B EW731", valid: true },
    { plate: "6C 42198", valid: true },
    { plate: "K 213455", valid: true },
    { plate: "10B 727U", valid: true }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end

end

RSpec.describe PlateValidator::MarylandValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "KX 1972", valid: true },
    { plate: "CCB 116", valid: true },
    { plate: "AYC 107", valid: true },
    { plate: "HAW 938", valid: true },
    { plate: "5CL Z83", valid: true },
    { plate: "4TC Y67", valid: true },
    { plate: "7M/D2405", valid: true },
    { plate: "1G/F6783", valid: true },
    { plate: "6ED6316", valid: true },
    { plate: "0HM1476", valid: false },
    { plate: "IG 8697", valid: false }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end

RSpec.describe PlateValidator::NewYorkValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "282-YYY", valid: true },
    { plate: "5792-AAN", valid: true },
    { plate: "5GC 386", valid: true },
    { plate: "HJ7 90E", valid: true },
    { plate: "5CL Z83", valid: false },
    { plate: "GXB-5332", valid: true },
    { plate: "LAV-9002", valid: true }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end

RSpec.describe PlateValidator::OregonValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "8D-1403", valid: true },
    { plate: "6P-3157", valid: true },
    { plate: "GGT 239", valid: true },
    { plate: "LNT 040", valid: true },
    { plate: "NFJ 077", valid: true },
    { plate: "QFM713", valid: true },
    { plate: "YWT 225", valid: true },
    { plate: "942 FQL", valid: true },
    { plate: "2I-6767", valid: false },
    { plate: "9O-1955", valid: false }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end

RSpec.describe PlateValidator::UtahValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "W88 6TP", valid: true },
    { plate: "Y999US", valid: true },
    { plate: "G42 0YU", valid: false },
    { plate: "I15 7GG", valid: false },
    { plate: "Q44 8UA", valid: false },
    { plate: "535 AGA", valid: true },
    { plate: "727-WYS", valid: false },
    { plate: "UGU 420", valid: true },
    { plate: "AWD S22", valid: false }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end

RSpec.describe PlateValidator::WashingtonValidator do
  it_behaves_like "a plate validator"

  before { @validator = described_class.new }

  test_cases = [
    { plate: "039-ABS", valid: true },
    { plate: "494-HBS", valid: true },
    { plate: "458-UGU", valid: true },
    { plate: "AZM9590", valid: true },
    { plate: "240-IDK", valid: false },
    { plate: "CRI7206", valid: false }
  ]

  context "correctly validates plates" do
    test_cases.each do |test_case|
      it "reports '#{test_case[:plate]}' as #{test_case[:valid] ? "valid" : "NOT valid"}" do
        expect(@validator.valid?(test_case[:plate])).to eq(test_case[:valid])
      end
    end
  end
end
