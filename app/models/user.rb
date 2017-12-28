class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  has_many :registered_applications, dependent: :destroy

end
