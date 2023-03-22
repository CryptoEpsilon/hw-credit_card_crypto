require 'rbnacl'
require 'base64'

module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    Base64.strict_encode64(RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes))
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    box = RbNaCl::SimpleBox.from_secret_key(Base64.strict_decode64(key))
    encrypted = box.encrypt(document.to_s)
    Base64.strict_encode64(encrypted)
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    encrypted = Base64.strict_decode64(encrypted_cc)
    box = RbNaCl::SimpleBox.from_secret_key(Base64.strict_decode64(key))
    box.decrypt(encrypted)
  end
end
