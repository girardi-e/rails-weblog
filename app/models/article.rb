class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 40 }
  validates :body, length: { minimum: 10 }
  validates :body, length: { maximum: 200 }
end
