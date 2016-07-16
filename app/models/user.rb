class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists

  validates :name, presence: true
  validates :password, presence: true
end
