class User < ApplicationRecord
 has_many :images
 
 validates :username, presence: true, uniqueness: true
 validates :password, presence: true, length: { in: 8..30 }
 validates :email, presence: true, uniqueness: true
 validates :age, numericality: { only_integer: true, greater_thab: 12, less_than: 120}
 validate :must_have_secure_password 

  #create a custom method to use in validation 
   def must_have_secure_password
     insecure_passwords = ['password', 'password123', '12345578910']
     if insecure_passwords.include?(password)
       errors.add :password, "must be secure"
     end
   end


end
