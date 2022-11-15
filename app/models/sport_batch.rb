class SportBatch < ApplicationRecord
  belongs_to :sport
  belongs_to :batch

  has_many :sport_batch_branches, dependent: :destroy
  has_many :branches, through: :sport_batch_branches, source: :branch
end

# sport_id, batch_id
