module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    #number = 4539075978941247
    nums_a = number.to_s.chars.map(&:to_i)
    ultimo = nums_a.delete_at(nums_a.size-1)
    nums_a.reverse!
    nums_a = nums_a.map.with_index do |n,i|
      i.odd? ? n*1 : n*2
    end
    luhn = nums_a.to_s.chars.map(&:to_i).inject(:+) + ultimo
    luhn%10==0? true : (puts "Usage:  Credit Card number invalid")
  end
end
