class Raindrops
  def self.convert(n)
    result = ""

    {3 => "Pling", 5 => "Plang", 7 => "Plong"}.select do |d, s|
      if n % d == 0
        result += s
      end
    end

    if result.empty?
      n.to_s
    else
      result
    end
  end
end

puts Raindrops.convert 30
puts Raindrops.convert 4
