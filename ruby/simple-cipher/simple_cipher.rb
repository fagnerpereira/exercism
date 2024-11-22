class Cipher
  DEFAULT_KEY = "aaaaaaaaaa"
  attr_reader :key

  def initialize(key = DEFAULT_KEY)
    @key = key
    validate_key
  end

  def decode(encoded)
  end

  def encode(plaintext)
    plaintext_chars = plaintext.chars
    key_chars = key.chars
    cipher = []

    plaintext_chars.each_with_index do |char, i|
      cipher << [char, key_chars[i]]
    end

    print plaintext_chars
    print key_chars
    print cipher
    cipher.values
  end

  private

  def validate_key
    raise ArgumentError unless /\A[a-z]+\z/.match?(key)
  end
end
