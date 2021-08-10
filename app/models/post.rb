class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :user, :project

  has_many :elements
  has_one_attached :header_image

  has_rich_text :body

  validates_presence_of :title, :work_stage, :description

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end

  def optimized_image(image,x,y)
    return image.variant(resize_to_fill: [x, y])#.processed
  end
end
