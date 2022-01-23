class Value
  attr_reader :name, :base_weight

  def initialize(base_weight)
    @base_weight = base_weight
  end

  def convert
    @base_weight
  end

  def message
    "#{base_weight} #{self.class.to_s.downcase}s = #{convert} kg"
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

class Gramm < Value
  def convert
    @base_weight * 0.001
  end
end

class Pound < Value
  def convert
    @base_weight * 0.453592
  end
end

class Pood < Value
  def convert
    @base_weight * 16.3807
  end
end
