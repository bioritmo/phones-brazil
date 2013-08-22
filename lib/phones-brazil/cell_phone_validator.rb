module PhonesBrazil
  class CellPhoneValidator < ActiveModel::Validator
    def validate(record)
      record.errors.add :base, :invalid unless phone_valid?(record.area,record.number)
    end

    def phone_valid?(area,number)
      PhonesBrazil::CellPhone.new(area,number).valid?
    end
  end
end