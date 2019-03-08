class Article < ApplicationRecord
  has_many :comments, class_name: "Comment", dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
