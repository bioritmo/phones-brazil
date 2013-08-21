module PhonesBrazil
  class CellPhone

    def initialize(area,number)
      @area = area.to_i
      @number = number
    end

    def valid?
      valid_area? && valid_number? && valid_number_size?
    end

  private
    def valid_area?
      area_codes.include?(@area)
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
      else
        @number.size == 8
      end
    end

    def is_included?(range, number)
      sme_ranges[range].any? {|r| r.include?(number)}
    end

    def area_codes
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

    def sme_ranges
      {
        11 => [(70000000..70109999), (77000000..78999999), (79000000..79089999),
          (79100000..79219999), (79230000..79499999)],
        12..19 => [(77000000..78999999)]
      }
    end

  end
end