module PhonesBrazil
  class CellPhoneValidator < ActiveModel::Validator
    def validate(record)
      errors.add :base, :invalid unless phone_valid?(record.area,record.number)
    end

    def phone_valid?(area,number)
      PhonesBrazil::CellPhone.valid?(area,number)
    end
  end
end