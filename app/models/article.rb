class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }


end
