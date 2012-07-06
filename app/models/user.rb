# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation
    has_secure_password
    
    before_save { |user| user.email = email.downcase }
    
    VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
end
