class Request < ApplicationRecord
	belongs_to :user
	validates :request_accepted, presence: true
end
