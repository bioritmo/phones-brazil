require 'phones-brazil/cell_phone'

describe PhonesBrazil::CellPhone do
  describe "valid phones" do
    context "from area code 11" do
      it { PhonesBrazil::CellPhone.new("11", "991877741").should be_valid }
      it { PhonesBrazil::CellPhone.new("11", "77000001").should be_valid }
    end

    context "from area code 12-19" do
      it { PhonesBrazil::CellPhone.new("15", "991111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("19", "971111111").should be_valid }
    end

    context "from area code 21" do
      it { PhonesBrazil::CellPhone.new("21", "921321212").should be_valid }
      it { PhonesBrazil::CellPhone.new("21", "70111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("21", "77111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("21", "78111111").should be_valid }
    end

    context "from area codes 22, 24, 27, 28" do
      it { PhonesBrazil::CellPhone.new("22", "970111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("28", "971111111").should be_valid }
    end
  end

  describe "invalid phones" do
    context "nonexistant area code" do
      it { PhonesBrazil::CellPhone.new("25", "918454654").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("111", "91877741").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("1", "91877741").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("", "918454654").should_not be_valid }
    end

    context "invalid size" do
      context "from area code 11" do
        it { PhonesBrazil::CellPhone.new("11", "9213211").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("11", "92132121").should_not be_valid }
      end

      context "from area codes 12-19" do
        it { PhonesBrazil::CellPhone.new("19", "92132121").should_not be_valid }
      end

      context "from area code 21" do
        it { PhonesBrazil::CellPhone.new("21", "61111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "81111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "91111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "71111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "72111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "73111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "74111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "75111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "76111111").should_not be_valid }
        it { PhonesBrazil::CellPhone.new("21", "79111111").should_not be_valid }
      end

      context "from area codes 22, 24, 27, 28" do
        it { PhonesBrazil::CellPhone.new("22", "70111111").should_not be_valid }
      end
    end

    context "not numbers" do
      it { PhonesBrazil::CellPhone.new("XX", "918454654").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "9213211A").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "9213-2112").should_not be_valid }
    end
  end
end