class User < ApplicationRecord
    has_secure_password
    belongs_to :factory

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :factory_id, presence: true
    validates :email, uniqueness: true
    validates :password, confirmation: { case_sensitive: true }

    validates :password, length: { in: 6..220 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    def self.find_by_auth_or_create(auth)
        user = User.new(email: auth['info']['email'])
        user.name = auth['info']['name']
        user.password = auth['uid']
        user.password_digest_confirmation =  auth['uid']
        user.factory_id = 1
        user.super_user = false
        
        user.save
        user
    end
end
