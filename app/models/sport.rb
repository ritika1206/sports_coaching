class Sport < ApplicationRecord
  has_many :sport_batches, dependent: :destroy
  has_many :batches, -> { distinct }, through: :sport_batches
  has_many :branches, -> { distinct }, through: :sport_batches

  has_many :sport_batch_branches, through: :sport_batches
  has_many :users, -> { distinct }, through: :sport_batch_branches
  has_many :coachings, -> { distinct }, through: :sport_batch_branches

  validates :name, presence: true
end

# name
