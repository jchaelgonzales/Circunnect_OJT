class User < ApplicationRecord
	has_many :request
	has_secure_token :auth_token
	has_secure_password

	# validates :username, presence: true
	# validates :email, presence: true
	# validates :password, presence: true
	# validates :first_name, presence: true
	# validates :last_name, presence: true
	# validates :birthday, presence: true
	# validates :gender, presence: true
	# validates :address_street, presence: true
	# validates :address_city, presence: true
	# validates :address_province, presence: true
	# validates :contact_no, presence: true
end
