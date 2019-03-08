class Comment < ApplicationRecord
  belongs_to :article, class_name: "Article", required: true
  validates :content, presence: true
end
