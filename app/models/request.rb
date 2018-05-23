class Request < ApplicationRecord
	belongs_to :user

	validates :request_status, presence: true
end
