require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "comment_confirmation" do
    mail = Notification.comment_confirmation
    assert_equal "Comment confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
