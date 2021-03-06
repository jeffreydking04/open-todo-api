class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true
  validates :permission, inclusion: { in: %w(private viewable open) }
end
