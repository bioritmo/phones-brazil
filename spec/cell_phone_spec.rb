require 'phones-brazil/cell_phone'

describe PhonesBrazil::CellPhone do
  describe "valid phones" do
    it { PhonesBrazil::CellPhone.new("11", "991877741").should be_valid }
    it { PhonesBrazil::CellPhone.new("15", "912115667").should be_valid }
    it { PhonesBrazil::CellPhone.new("19", "918454654").should be_valid }
    it { PhonesBrazil::CellPhone.new("11", "77000001").should be_valid }
  end

  describe "invalid phones" do
    context "nonexistant area code" do
      it { PhonesBrazil::CellPhone.new("25", "918454654").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("111", "91877741").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("1", "91877741").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("", "918454654").should_not be_valid }
    end

    context "invalid size" do
      it { PhonesBrazil::CellPhone.new("11", "9213211").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "92132121").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("19", "92132121").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("21", "921321212").should_not be_valid }
    end

    context "not numbers" do
      it { PhonesBrazil::CellPhone.new("XX", "918454654").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "9213211A").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "9213-2112").should_not be_valid }
    end
  end
end