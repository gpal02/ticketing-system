class User < ApplicationRecord
  rolify

  has_many :buses
  has_many :tickets

  has_attached_file :avatars

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable , :validatable

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  

  after_create :add_user_role

  after_initialize :init


  STATUSES = ['pending','approved','rejected']
  

  private
  
  def init
    self.status ||= STATUSES[0]
  end
  
  def add_user_role
    role = Role.find_by(id:role_id)
    self.add_role role.name.to_sym
  end
end
