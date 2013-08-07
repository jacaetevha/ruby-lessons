class Sonority
  attr_reader :sound

  def initialize sound
    @sound = sound
  end

  def flat; Flat.new(sound); end
  def double_flat; DoubleFlat.new(sound); end
  def sharp; Sharp.new(sound); end
  def double_sharp; DoubleSharp.new(sound); end

  def to_s; sound; end
end

class Flat < Sonority
  def flat; DoubleFlat.new(sound); end
  def sharp; Kernel::const_get("#{sound}nat"); end
  def to_s; "#{super}b"; end
end

class DoubleFlat < Sonority
  def flat; raise "can't flat a double flat: #{self}"; end
  def sharp; Kernel::const_get("#{@sound}flat"); end
  def to_s; "#{super}bb"; end
end

class Sharp < Sonority
  def flat; Kernel::const_get("#{sound}nat"); end
  def sharp; DoubleSharp.new(sound); end
  def to_s; "#{super}#"; end
end

class DoubleSharp < Sonority
  def flat; Kernel::const_get("#{@sound}sharp"); end
  def sharp; raise "can't sharp a double sharp: #{self}"; end
  def to_s; "#{super}x"; end
end

module Kernel
  ('A'..'G').to_a.each do |note|
    const_set("#{note}nat",   Sonority.new(note))
    const_set("#{note}flat",  const_get("#{note}nat").flat)
    const_set("#{note}sharp", const_get("#{note}nat").sharp)
  end
end

