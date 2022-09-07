class User < ApplicationRecord
	validates :first_name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :age, length: { maximum: 3 }
	validates :age, numericality: { only_integer: true }

	scope :age_must_be_18, -> { where("age > 18") }


	def self.latest_users
		User.all.order(created_at: :desc)
	end
end
