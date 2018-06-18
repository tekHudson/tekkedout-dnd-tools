class Action < ApplicationRecord
  belongs_to :creature

  validates :name, presence: true
end
