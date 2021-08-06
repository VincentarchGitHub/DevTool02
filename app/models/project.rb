class Project < ApplicationRecord
  belongs_to :user
  # Active Storage from Rails 5
  has_one_attached :thumbnail
  has_one_attached :banner
  # Action Text from Rails 6
  has_rich_text :body

  validates :ref_num, presence: true
  validates :postcode, presence: true

  self.per_page = 10
  extend FriendlyId
  friendly_id :ref_num, use: :slugged

  def optimized_image(image,x,y)
    return image.variant(resize_to_fill: [x, y])#.processed
  end
end
