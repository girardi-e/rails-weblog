class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { in: 2..40 }
  validates :body, length: { in: 10..1000 }
end
