class Category < ApplicationRecord
  has_many :goods
  has_many :brands
  has_ancestry
end
