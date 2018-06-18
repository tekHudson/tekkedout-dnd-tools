class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :registerable,
         :trackable, :validatable, :lockable, :confirmable
  has_many :combat_trackers

  validate :password_is_complex

  include Users::CombatTrackerManipulator

  def password_is_complex
    return if password.nil?
    return if password =~ /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/
    errors.add(:password, "must have at least a letter, capital letter, and digit")
  end
end
