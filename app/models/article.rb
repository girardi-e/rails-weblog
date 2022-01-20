class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { in: 2..40 }
  validates :body, length: { in: 10..1000 }

  VALID_STATUSES = [ 'public', 'private', 'archived' ]

  validades :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
