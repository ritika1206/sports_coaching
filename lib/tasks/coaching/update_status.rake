namespace :coaching do
  desc 'Update coaching status'
  task 'update_status' => [:environment] do
    Coaching.active.update(status: 'inactive') if Date.today == Date.today.end_of_month
  end
end
