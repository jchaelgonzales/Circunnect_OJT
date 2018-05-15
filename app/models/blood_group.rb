class BloodGroup < ApplicationRecord
	belongs_to :user
	validates :blood_type, presence: true
end
