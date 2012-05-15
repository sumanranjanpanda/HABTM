class UserMailer < ActionMailer::Base
   
 def welcome_mail(user)
    recipients    user.email
    from          "Admin"
    subject       "Forgot password"
    sent_on       Time.now
    body          (:message=>"your username is  <b>#{user.username}</b> and your password is <b>#{user.password}</b>" ,:url => "http://192.168.5.140:3000/")
  end

end


