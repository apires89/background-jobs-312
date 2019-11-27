class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "im' starting a fake job right now"
    sleep 4
    print_user
    puts "job done"
    # Do something later
  end

  def print_user
    @user = User.first
    puts @user.email
  end
end
