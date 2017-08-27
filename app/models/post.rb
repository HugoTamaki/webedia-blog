class Post < ApplicationRecord
  validates :title, :subtitle, :content, presence: true

end
