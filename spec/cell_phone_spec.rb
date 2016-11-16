require 'phones-brazil/cell_phone'

describe PhonesBrazil::CellPhone do
  describe "valid phones" do
    context "from area code 11" do
      it { PhonesBrazil::CellPhone.new("11", "991877741").should be_valid }
      it { PhonesBrazil::CellPhone.new("11", "77000001").should be_valid }
    end

    context "from area code 12-19" do
      it { PhonesBrazil::CellPhone.new("15", "991111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("15", "70111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("15", "77111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("15", "78111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("19", "991111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("19", "70111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("19", "77111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("19", "78111111").should be_valid }
    end

    context "from areas code 21, 22, 24" do
      [21, 22, 24].each do |area|
        it { PhonesBrazil::CellPhone.new(area, "921321212").should be_valid }
        it { PhonesBrazil::CellPhone.new(area, "70111111").should be_valid }
        it { PhonesBrazil::CellPhone.new(area, "77111111").should be_valid }
        it { PhonesBrazil::CellPhone.new(area, "78111111").should be_valid }
      end
    end

    context "from area code 27" do
      it { PhonesBrazil::CellPhone.new("27", "970111111").should be_valid }
      it { PhonesBrazil::CellPhone.new("27", "78111111").should be_valid }
    end

    context "from area code 28" do
      it { PhonesBrazil::CellPhone.new("28", "970111111").should be_valid }
    end

    context 'from area codes 31 34 37' do
      [31, 34, 37].each do |area|
        it { PhonesBrazil::CellPhone.new(area, "970111111").should be_valid }
        it { PhonesBrazil::CellPhone.new(area, "77111111").should be_valid }
        it { PhonesBrazil::CellPhone.new(area, "78111111").should be_valid }
      end
    end

    context 'from area code 41, 44, 47, 48, 51, 54, 61, 62, 65, 71, 73, 75, 81, 85' do
      [41, 44, 47, 48, 51, 54, 61, 62, 65, 71, 73, 75, 81, 85].each do |area|
        it { PhonesBrazil::CellPhone.new(area, "971111111").should be_valid }
        it { PhonesBrazil::CellPhone.new(area, "78111111").should be_valid }
      end
    end

    context "from area code 28, 32, 33, 35, 38, 45, 46, 49, 53," \
      " 55, 63, 64, 66..69, 74, 77, 79, 82, 83, 84, 86..99 " do
      [28, 32, 33, 35, 38, 45, 46, 49, 53, 55, 63, 64, 66, 67, 68, 69, 74,
       77, 79, 82, 83, 84].each do |area|
        it { PhonesBrazil::CellPhone.new(area, "970111111").should be_valid }
      end
      (86..89).each do |area|
        it { PhonesBrazil::CellPhone.new(area, "970111111").should be_valid }
      end
      (91..99).each do |area|
        it { PhonesBrazil::CellPhone.new(area, "970111111").should be_valid }
      end
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

      context "from areas code 21, 22, 24" do
        [21, 22, 24].each do |area|
          it { PhonesBrazil::CellPhone.new(area, "61111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "81111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "91111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "71111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "72111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "73111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "74111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "75111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "76111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "79111111").should_not be_valid }
        end
      end

      context "from area code 27" do
        it { PhonesBrazil::CellPhone.new("27", "79111111").should_not be_valid }
      end

      context "from area code 28, 32, 33, 35, 38, 45, 46, 49, 53," \
        " 55, 63, 64, 66..69, 74, 77, 79, 82, 83, 84, 86..99 " do
        [28, 32, 33, 35, 38, 45, 46, 49, 53, 55, 63, 64, 66, 67, 68, 69, 74,
         77, 79, 82, 83, 84].each do |area|
          it { PhonesBrazil::CellPhone.new(area, "70111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "77111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "78111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "79111111").should_not be_valid }
        end
        (86..99).each do |area|
          it { PhonesBrazil::CellPhone.new(area, "70111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "77111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "78111111").should_not be_valid }
          it { PhonesBrazil::CellPhone.new(area, "79111111").should_not be_valid }
        end
      end
    end

    context "not numbers" do
      it { PhonesBrazil::CellPhone.new("XX", "918454654").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "9213211A").should_not be_valid }
      it { PhonesBrazil::CellPhone.new("11", "9213-2112").should_not be_valid }
    end
  end
end