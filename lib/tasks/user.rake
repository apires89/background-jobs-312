namespace :user do
  desc "Enrinching all user with ClearBit API"
  task update_all: :environment do
    #get all users
    users = User.all
    #iterate them
    users.each do |user|
      UpdateUserJob.perform_later(user.id)
    end
    #apply clearbit api to them
  end
  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end
