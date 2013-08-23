require "active_record"

module PhonesBrazil
  module Validator
    class CellPhoneValidator < ActiveModel::Validator
      def validate(record)
        record.errors.add :base, :invalid unless phone_valid?(record.area,record.number)
      end

      def phone_valid?(area,number)
        PhonesBrazil::CellPhone.new(area,number).valid?
      end
    end
  end

  module ClassMethods
    def validates_cellphone
      validates_with ActiveRecord::Base::CellPhoneValidator
    end
  end
end

ActiveRecord::Base.send(:include, PhonesBrazil::Validator)
ActiveRecord::Base.send(:extend, PhonesBrazil::ClassMethods)