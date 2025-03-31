class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def user?
    role == 0
  end

  def admin?
    role == 1
  end


  before_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  private

  def set_default_role
    self.role ||= 0  # Если роль не указана, по умолчанию будет 'user'
  end
end
