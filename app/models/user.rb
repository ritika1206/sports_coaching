class User < ApplicationRecord
  REGEX_EMAIL = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/

  has_many :coachings, counter_cache: :coachings_count, dependent: :destroy
  has_many :enrolled_branches, through: :coachings, source: :branch
  has_many :enrolled_sports, through: :coachings, source: :sport

  validates :name, :email, presence: true
  with_options allow_blank: true do
    validates :email, uniqueness: true, format: { with: REGEX_EMAIL  }
    validates :name, format: { with: SportsCoaching::REGEX_NAME }
  end
end

# name, email, coachings_count
