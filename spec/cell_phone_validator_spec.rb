require 'phones-brazil/cell_phone_validator'

describe CellPhoneValidator do
  context "valid phones" do
    it { CellPhoneValidator.new("11", "991877741").should be_valid }
    it { CellPhoneValidator.new("15", "912115667").should be_valid }
    it { CellPhoneValidator.new("19", "918454654").should be_valid }
    it { CellPhoneValidator.new("11", "77000001").should be_valid }
  end

  context "invalid phones" do
    it { CellPhoneValidator.new("21", "321321212").should_not be_valid }
    it { CellPhoneValidator.new("11", "92132121").should_not be_valid }
    it { CellPhoneValidator.new("19", "92132121").should_not be_valid }
  end
end