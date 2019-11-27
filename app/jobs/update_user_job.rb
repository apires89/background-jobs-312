class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Calling ClearBit API to search for user email"
    sleep 2
    puts "Done enrinched #{user.email}"
    # Do something later
  end
end
