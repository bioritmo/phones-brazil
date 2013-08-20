class CellPhoneValidator

  def initialize(area,number)
    @area = area.to_i
    @number = number
  end

  def valid?
    case @area
    when 11
      (@number.size == 9 && !is_included?("SP11", @number.to_i)) ||
      (@number.size == 8 && is_included?("SP11", @number.to_i))
    when 12..19
      (@number.size == 9 && !is_included?("SP1X", @number.to_i)) ||
      (@number.size == 8 && is_included?("SP1X", @number.to_i))
    else
      @number.size <= 8
    end
  end

private
  def sme_ranges
    {
      "SP11" => [(70000000..70109999), (77000000..78999999), (79000000..79089999),
        (79100000..79219999), (79230000..79499999)],
      "SP1X" => [(77000000..78999999)]
    }
  end

  def is_included?(range, number)
    sme_ranges[range].any? {|r| r.include?(number)}
  end
end