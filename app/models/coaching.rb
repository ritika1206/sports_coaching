class Coaching < ApplicationRecord
  belongs_to :sport_batch_branch
  belongs_to :user

  has_many :branches, -> { distinct }, through: :sport_batch_branch, source: :branch
  has_many :batches, -> { distinct }, through: :branches
  has_many :sports, -> { distinct }, through: :branches

  validates :end, comparison: { greater_than: :beginning }

  with_options allow_blank: true do
    validates :user_id, uniqueness: { scope: [:sport_batch_branch_id] }
    validate :no_batch_clash
  end

  enum status: [:active, :inactive]

  before_create :set_coaching_duration_and_status

  private

    def set_coaching_duration
      self.beginning = Date.today.beginning_of_month
      self.end = Date.today.end_of_month
      
      self.status = 'active'
    end

    def no_batch_clash
      user.coachings.each do |coaching|
        unless (batch.to < coaching.batch.from) || (batch.from > coaching.batch.to)
          errors.add(:base, 'batch timings are clashing')
        end
      end
    end
end

# similar to calling it as sport_batch_branch_user
# user_id, sport_batch_branch_id, beginning(when coaching begins), end(when coaching ends), status(enum)
