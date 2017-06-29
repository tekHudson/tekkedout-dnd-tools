class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :registerable,
         :trackable, :secure_validatable, :lockable, :confirmable
end
