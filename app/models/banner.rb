class Banner < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :url, presence: true
end
