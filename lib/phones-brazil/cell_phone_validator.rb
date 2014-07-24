require "active_record"

module PhonesBrazil
  module Validator
    class CellPhoneValidator < ActiveModel::Validator
      def validate(record)
        record.errors.add :number, :invalid unless phone_valid?(record.area,record.number)
      end

      def phone_valid?(area,number)
        PhonesBrazil::CellPhone.new(area,number).valid?
      end
    end
  end
end
