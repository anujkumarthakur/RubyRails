require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test "creates a SupportRequest upon receiving a support email" do
    receive_inbound_email_from_mail(
      to: "support@example.com",
      from: "test@gmail.com",
      subject: "Need help",
      body: "I can't figure out how to check out!!"
    )
    
    support_request = SupportRequest.last
    assert_equal "test@gmail.com", support_request.email
    assert_equal "Need help", support_request.subject
    assert_equal "I can't figure out how to check out!!", support_request.body
    assert_nil support_request.order
  end

end
