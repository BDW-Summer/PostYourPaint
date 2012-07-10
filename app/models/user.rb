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
    has_many :paints, dependent: :destroy
    
    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token
    
    VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    
    def inventory
        #This is preliminary. See "Following user" for the full implementation
        Paint.where("user_id = ?", id)
    end
    
    private 
        
        def create_remember_token
            self.remember_token = SecureRandom.urlsafe_base64
        end
end
