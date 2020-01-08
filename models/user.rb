class User < ActiveRecord::Base
  has_many :workplaces, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #pundit用にroleを分ける
  enum role: [:normal, :register, :admin]
  validates :role, inclusion: {in: %w(normal register), message: "%{value}は無効です"}
  validates :email, uniqueness:{message:'はすでに使用されています'}
end
