require 'note'

describe NoteFormatter do
  it 'formats a Note object into readable text' do
    # note = double(:note)
    # allow(note).to receive(:title).and_return('Hello')
    # allow(note).to receive(:body).and_return('world')
    note = double(:note, title: 'Hello', body: 'world')
    expect(subject.format(note)).to eq("Title: Hello\nworld")
  end
end

describe Note do
  let(:noteformatter) { double(:noteformatter) }

  it 'stores a title and body' do
    note = Note.new("Hello","world",noteformatter)
    expect(note.title).to eq("Hello")
    expect(note.body).to eq("world")
  end
  it 'formats the title and body' do
    # how can we allow it to receive an argument of type NoteFormatter (or type double)/allow to accept self?

    # allow(noteformatter).to receive(:format).and_return("Title: Hello\nworld")
    # note = Note.new("Hello","world",noteformatter)
    # expect(note.display).to eq("Title: Hello\nworld")

    # how can we test that its two arguments are reproduced in the output?
    #or at least write the test so that its arguments match? perhaps like:
    title, body  = "Hello", "world"
    allow(noteformatter).to receive(:format).with(anything()).and_return("Title: #{title}\n#{body}")
    note = Note.new(title, body, noteformatter)
    expect(note.display).to eq("Title: #{title}\n#{body}")
  end
end
