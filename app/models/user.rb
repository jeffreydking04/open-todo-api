class User < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates :name, presence: true
  validates :password, presence: true
end
