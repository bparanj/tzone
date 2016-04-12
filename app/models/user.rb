class User < ApplicationRecord
  def password=(text)
    # You must store encrypted password. 
    self.crypted_password = text
  end
end
