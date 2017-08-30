class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.comment_confirmation.subject
  #
  
  def comment_confirmation(comment)
  	@user = User.find_by(is_admin: true)
  	      @comment = comment
  	     
    # mail to: "#{@comment.user.email}", subject: "comment - #{@comment.body}"
    mail to: "#{@user.email}", subject: "comment added by #{@comment.user.username}"
  end

end
