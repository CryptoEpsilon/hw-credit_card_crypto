# frozen_string_literal: true

# DoubleTranspositionCipher Algorithm
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext

    size = document.to_s.length
    col = Math.sqrt(size).ceil

    text_matrix = to_matrix(document.to_s, col)
    transposition = text_matrix.shuffle(random: Random.new(key))
    transposition.map { |row| row.split('').shuffle(random: Random.new(key)).join }.join
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    size = ciphertext.length
    col = Math.sqrt(size).ceil

    cipher_matrix = to_matrix(ciphertext, col)
    reverse_row = reverse_shuffle(cipher_matrix, key)
    reverse_col = reverse_row.map { |row| reverse_shuffle(row.split(''), key) }.join
    reverse_col.delete('#')
  end

  def self.reverse_shuffle(array, key)
    (0...array.length).to_a.shuffle(random: Random.new(key)).zip(array).sort.map(&:last)
  end

  def self.to_matrix(text, col)
    matrix = text.scan(/.{1,#{col}}/).to_a
    matrix[col - 2] << '#' until matrix[col - 2].length == col
    matrix
  end
end
