class Category < ActiveRecord::Base
  has_and_belongs_to_many :banners

  validates :name, presence: true
end
