class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, presence: true
  validates :slug, presence: true, uniqueness:true

  def to_param
    slug
  end
end
