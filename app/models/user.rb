class User < ApplicationRecord
  rolify

  # has_many :tickets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #, :validatable

  # after_create :add_user_role

  private
  def add_user_role
    role = Role.find_by(id:role_id)
    self.add_role role.name.to_sym
  end
end
