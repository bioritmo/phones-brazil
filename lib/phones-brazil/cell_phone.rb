module PhonesBrazil
  class CellPhone

    def initialize(area,number)
      @area = area.to_i
      @number = number.to_s
    end

    def valid?
      valid_area? && valid_number? && valid_number_size?
    end

    def self.area_codes
      (11..19).to_a +                   # SP
      [21,22,24,27,28] +                # RJ,ES
      (31..35).to_a + [37,38] +         # MG
      (41..49).to_a +                   # PR, SC
      [51] + (53..55).to_a +            # RS
      (61..69).to_a +                   # DF, GO, MT, MS, AC, RO
      [71] + (73..75).to_a + [77,79] +  # BA, SE
      (81..89).to_a +                   # PE, AL, PB, RN, CE, PI
      (91..99).to_a                     # PA, AM, RR, AP, MA
    end

  private
    def valid_area?
      CellPhone.area_codes.include?(@area)
    end

    def valid_number?
      @number.match(/\d{8,}/)
    end

    def valid_number_size?
      case @area
      when 11
        (@number.size == 9 && !is_included?(11, @number.to_i)) ||
        (@number.size == 8 && is_included?(11, @number.to_i))
      when 12..19
        (@number.size == 9 && !is_included?(12..19, @number.to_i)) ||
        (@number.size == 8 && is_included?(12..19, @number.to_i))
      when 21
        (@number.size == 9 && !is_included?(21, @number.to_i)) ||
        (@number.size == 8 && is_included?(21, @number.to_i))
      when 22, 24, 27, 28
        (@number.size == 9 && !is_included?([22, 24, 27, 28], @number.to_i)) ||
        (@number.size == 8 && is_included?([22, 24, 27, 28], @number.to_i))
      when 31, 32, 33, 34, 35, 37, 38
        (@number.size == 9 && !is_included?([31, 32, 33, 34, 35, 37, 38], @number.to_i)) ||
        (@number.size == 8 && is_included?([31, 32, 33, 34, 35, 37, 38], @number.to_i))
      when 71, 73, 74, 75, 77, 79
        (@number.size == 9 && !is_included?([71, 73, 74, 75, 77, 79], @number.to_i)) ||
        (@number.size == 8 && is_included?([71, 73, 74, 75, 77, 79], @number.to_i))
      when 81..89
        (@number.size == 9 && !is_included?(81..89, @number.to_i)) ||
        (@number.size == 8 && is_included?(81..89, @number.to_i))
      when 91..99
        (@number.size == 9 && !is_included?(91..99, @number.to_i)) ||
        (@number.size == 8 && is_included?(91..99, @number.to_i))
      else
        @number.size == 8
      end
    end

    def is_included?(range, number)
      sme_ranges[range].any? { |r| r.include?(number) }
    end

    def sme_ranges
      {
        11 => [(70000000..70109999), (77000000..78999999), (79000000..79089999),
          (79100000..79219999), (79230000..79499999)],
        12..19 => [(77000000..78999999)],
        21 => [(70000000..70999999), (77000000..78999999)],
        [22, 24, 27, 28] => [(77000000..78999999)],
        [31, 32, 33, 34, 35, 37, 38] => [(74000000..78999999)],
        [71, 73, 74, 75, 77, 79] => [(74000000..78999999)],
        81..89 => [(74000000..78999999)],
        91..99 => [(74000000..78999999)]
      }
    end

  end
end
