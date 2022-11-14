class Coaching < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :branch, counter_cache: true
  belongs_to :sport, counter_cache: true

  validates :from, :beginning, presence: true
  validates :to, comparison: { greater_than: :from }
  validates :end, comparison: { greater_than: :beginning }

  with_options allow_blank: true do
    validates :user_id, uniqueness: { scope: [:branch_id, :sport_id] }
    validate :no_batch_clash
  end

  before_create :set_coaching_duration

  private

    def set_coaching_duration
      self.beginning = Date.today.beginning_of_month
      self.end = Date.today.end_of_month
    end

    def no_batch_clash
      Coaching.where(user_id: user_id).each do |coaching|
        unless (to < coaching.from) || (from > coaching.to)
          errors.add(:base, 'batch timings are clashing')
        end
      end
    end
end

# user_id, branch_id, sport_id, batch_from(when batch starts), batch_to(when batch ends), beginning(when coaching begins), end(when coaching ends)
