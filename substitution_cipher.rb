# frozen_string_literal: true

# SubstitutionCipher Algorithm
module SubstitutionCipher
  # Caesar Implement
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher

      document.to_s.chars.map { |c| (c.ord + key).chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher

      encrypt(document, -key)
    end
  end

  # Permutation Implement
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher

      shuffled_chars = (32..126).to_a.shuffle(random: Random.new(key))
      char_map = Hash[(32..126).to_a.zip(shuffled_chars)]
      document.to_s.chars.map { |c| char_map[c.ord].chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher

      shuffled_chars = (32..126).to_a.shuffle(random: Random.new(key))
      char_map = Hash[shuffled_chars.zip((32..126).to_a)]
      document.to_s.chars.map { |c| char_map[c.ord].chr }.join
    end
  end
end
