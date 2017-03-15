class Tag < ApplicationRecord
  #Kapcsolatok
  has_and_belongs_to_many :articles
end
