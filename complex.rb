class ComplexNumber
  attr_accessor :real, :img
  @@state = {'+' => 0, '*' => 0, bulk_add: 0, bulk_multiplay: 0}

  def initialize(real_num, img_num)
    @real = real_num
    @img = img_num
  end

  def +(other)
    @@state['+'] += 1
    ComplexNumber.new(@real + other.real, @img + other.img)
  end

  def *(other)
    @@state['*'] += 1
    ComplexNumber.new(@real * other.real, @img * other.img)
  end

  def self.bulk_add(cns)
    @@state[:bulk_add] += 1
    real = img = 0
    cns.each do |cn|
      # @addition_times += 1
      real += cn.real
      img += cn.img
    end
    ComplexNumber.new(real, img)
  end

  def self.bulk_multiplay(cns)
    @@state[:bulk_multiplay] += 1
    real = img = 1
    cns.each do |cn|
      # @addition_times += 1
      real *= cn.real
      img *= cn.img
    end
    ComplexNumber.new(real, img)
  end

  def to_s
    "#{@real} + #{@img}i"
  end

  def self.stats
    @@state
  end

end

# =============================== test the class =================================

c1 = ComplexNumber.new(1, 3)
c2 = ComplexNumber.new(4, 7)
c3 = ComplexNumber.new(9, 20)

c1_plus_c2 = c1 + c2
c1_mul_c2 = c1 * c2
bulk_addition = ComplexNumber.bulk_add([c1, c2, c3])
bulk_multiplay = ComplexNumber.bulk_multiplay([c1, c2, c3])


puts "\n\n========"
puts "c1 + c2 = #{c1_plus_c2.to_s}"
puts "c1 * c2 = #{c1_mul_c2.to_s}"
puts "c1 + c2 + c3 = #{bulk_addition.to_s}"
puts "c1 * c2 * c3 = #{bulk_multiplay.to_s}"
puts "Addition Times happened:\t#{ComplexNumber.stats['+']} times"
puts "multiplication times happened:\t#{ComplexNumber.stats['*']} times"
puts "Bulk additions times happened:\t#{ComplexNumber.stats[:bulk_add]} times"
puts "Bulk multiplication times happened:\t#{ComplexNumber.stats[:bulk_multiplay]} times"
puts "========\n\n"
