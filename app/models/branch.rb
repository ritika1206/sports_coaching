class Branch < ApplicationRecord
  has_many :sport_batch_branches, dependent: :destroy
  has_many :sport_batches, through: :sport_batch_branches, source: :sport_batch

  has_many :sports, -> { distinct }, through: :sport_batches, source: :sport
  has_many :batches, -> { distinct }, through: :sport_batches, source: :batch

  has_many :users, -> { distinct }, through: :sport_batch_branches
  has_many :coachings, -> { distinct }, through: :sport_batch_branches

  validates :name, presence: true
  validates :name, format: { with: REGEX_NAME }, allow_blank: true
end

# name
