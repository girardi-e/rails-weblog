class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, :body, presence: true
  validates :commenter, length: { minimum: 2 }
  validates :body, length: {
    maximum: 255,
    too_long: '%{count} characters is the maximum allowed.'
  }
end
