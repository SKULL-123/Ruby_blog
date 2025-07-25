class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all 
  validates :title, :content, presence: true
  validates :slug, presence: true, uniqueness:true

  def to_param
    slug
  end
end
