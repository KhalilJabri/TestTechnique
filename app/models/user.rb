class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, 
                        uniqueness: {case_sensitive: false}, 
                        length: {minimum: 3, maximum: 30}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      uniqueness: {case_sensitive: false},
                      format: {with: VALID_EMAIL_REGEX}

    validates :role, inclusion: { in: %w(admin member) }
     # ... other user fields and methods

     has_secure_password
  
    private

    enum role: { admin: 0, member: 1 }
  end