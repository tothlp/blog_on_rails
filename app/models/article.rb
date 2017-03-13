class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :title, presence: true,
            length: { minimum: 5 }
end
