class User < ApplicationRecord
  REGEX_EMAIL = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/

  has_many :coachings, dependent: :destroy
  has_many :active_coachings, -> { active }
  has_many :sport_batch_branches, through: :coachings, source: :sport_batch_branch

  has_many :batches, -> { distinct }, through: :coachings
  has_many :branches, -> { distinct }, through: :coachings
  has_many :sports, -> { distinct }, through: :coachings

  validates :name, :email, presence: true
  with_options allow_blank: true do
    validates :email, uniqueness: true, format: { with: REGEX_EMAIL  }
    validates :name, format: { with: SportsCoaching::REGEX_NAME }
  end
end

# name, email
