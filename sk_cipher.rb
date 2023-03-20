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
    nonce = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.nonce_bytes)
    box = RbNaCl::SecretBox.new(Base64.strict_decode64(key))
    encrypted = box.encrypt(nonce, document)
    Base64.strict_encode64([encrypted, nonce].join(":"))
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    encrypted, nonce = Base64.strict_decode64(encrypted_cc).split(":")
    box = RbNaCl::SecretBox.new(Base64.strict_decode64(key))
    box.decrypt(nonce, encrypted)
  end
end
