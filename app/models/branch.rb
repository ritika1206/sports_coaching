class Branch < ApplicationRecord
  has_many :coachings, dependent: :destroy
  has_many :sports, through: :coachings, source: :sport
  has_many :users, through: :coachings, source: :user

  validates :name, presence: true
  validates :name, format: { with: REGEX_NAME }, allow_blank: true
end

# name, coachings_count
