class Group < ApplicationRecord
	belongs_to :user_group
	has_many :users, through: :user_groups
end
