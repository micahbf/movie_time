class SendToFriendMailer < ActionMailer::Base
  default from: "movietime@example.com"

  def send_title_to_friend(title, email)
    @title = title
    mail(to: email, subject: "Check out #{@title.title}!")
  end
end
