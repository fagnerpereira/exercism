class Raindrops
  def self.convert(n)
    {3 => "Pling", 5 => "Plang", 7 => "Plong"}.select do |d, s|
      n % d == 0
    end.values.then do |result|
      if result.empty?
        n.to_s
      else
        result.join
      end
    end
  end
end
