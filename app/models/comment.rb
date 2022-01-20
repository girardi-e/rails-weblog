class Comment < ApplicationRecord
  belongs_to :article

  validates :commenter, :body, presence: true
  validates :commenter, length: { minimum: 2 }
  validates :body, length: {
    maximum: 255,
    too_long: '%{count} characters is the maximum allowed.'
  }

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
