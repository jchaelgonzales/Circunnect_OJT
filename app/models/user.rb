class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	has_many :request
	has_secure_token :auth_token
	has_secure_password
	validates_uniqueness_of :username, :email

	def invalidate_token
    	self.update_columns(auth_token: nil)
 	end

  	def self.valid_login?(username, password)
    	user = find_by(username: username)

    	if user && user.authenticate(password)
      		user
    	end
  	end

	# validates :username, presence: true
	# validates :email, presence: true
	# validates :password, presence: true, :on => :create
	# validates :first_name, presence: true
	# validates :last_name, presence: true
	# validates :birthday, presence: true
	# validates :gender, presence: true
	# validates :blood_type, presence: true
	# validates :address_street, presence: true
	# validates :address_city, presence: true
	# validates :address_province, presence: true
	# validates :contact_info, presence: true
	
end
