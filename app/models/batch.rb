class Batch < ApplicationRecord
  has_many :sport_batches, dependent: :destroy
  has_many :sports, -> { distinct }, through: :sport_batches

  has_many :branches, -> { distinct }, through: :sport_batches
  has_many :sport_batch_branches, through: :sport_batches

  has_many :users, -> { distinct }, through: :sport_batch_branches
  has_many :coachings, -> { distinct }, through: :sport_batch_branches

  validates :from, :to, presence: true
  validates :to, comparison: { greater_than: :from }, allow_blank: true
end

# from, to
