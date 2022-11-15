class SportBatchBranch
  belongs_to :sport_batch
  belongs_to :branch

  has_many :coachings, dependent: :destroy
  has_many :users, through: :coachings, source: :user
end

# sport_batch_id, branch_id
