class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_one :address
  accepts_nested_attributes_for :address
  # enum :admin => [true,false]
end
