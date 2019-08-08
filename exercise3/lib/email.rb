class EmailClient
  def initialize(message = Message.new)
    @message = message
  end
  def message
    @message
  end
end

class Message
  def send(to, body)
    "To: #{to}\n#{body}"
  end
end

class SayHelloToMyLittleFriend
  def initialize(email = EmailClient.new)
    @email = email
  end
  def run
    @email.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end
