require 'email'

describe SayHelloToMyLittleFriend do
  it 'sends an email' do
    message = double(:message, send: "To: Hello\nworld")

    emailclient = double(:emailclient, message: message)

    emailclient_class = double(:emailclient_class, new: emailclient)

    subj = SayHelloToMyLittleFriend.new(emailclient_class.new)

    expect { subj.run }.to_not raise_error
    expect(subj.run).to eq("To: Hello\nworld")
  end
end

describe EmailClient do
  it 'has a method #message which returns an instance of the Message class' do
    message = double(:message)
    message_class = double(:message_class, new: message)
    subj = EmailClient.new(message_class.new)
    expect(subj.message).to eq(message)
  end
end


describe Message do
  it 'sends a message (from its 2 arguments' do
    expect(subject.send('Hello','world')).to eq("To: Hello\nworld")
  end
end
