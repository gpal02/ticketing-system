class User < ApplicationRecord
  rolify

  has_many :buses
  has_many :tickets

  has_attached_file :avatars

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable , :validatable


  after_create :add_user_role

  after_initialize :init

  attr_accessor :login

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end

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
