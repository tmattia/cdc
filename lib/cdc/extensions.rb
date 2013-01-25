class Hash
  def subset_of?(other)
    other = other.normalize
    other.merge(self.normalize.select do |key, value|
      other.include?(key)
    end) == other
  end

  def normalize
    self.inject({}) do |hash, (key, value)|
     hash[key.to_s.downcase] = value
     hash
    end
  end
end
