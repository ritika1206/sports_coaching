class Sport < ApplicationRecord
  has_many :coachings, dependent: :destroy, counter_cache: :coachings_count
  has_many :users, through: :coachings, source: :user
  has_many :branches, through: :coachings, source: :branch

  enum name: [:cricket, :tennis, :badminton, :squash, :table_tennis]
end

# name, coachings_count
