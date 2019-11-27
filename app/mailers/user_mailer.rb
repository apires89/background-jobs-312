class  UserMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def welcome(user_id)
    user = User.find(user_id)
    puts "Welcome to my app"
    puts user.email

  end
end
