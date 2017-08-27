class Post < ApplicationRecord
  validates :title, :subtitle, :content, presence: true

  has_attached_file :image, styles: { normal: "1000x600>", small: "500x300>", thumb: "100x50" }, default_url: "http://placehold.it/500x350"
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
