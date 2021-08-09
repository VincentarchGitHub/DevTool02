class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project

  accepts_nested_attributes_for :user, :project

  has_many :elements

  validates_presence_of :title, :work_stage, :description

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end
end
