require 'note'

describe NoteFormatter do
  it 'formats a Note object into readable text' do
    note = double(:note)
    allow(note).to receive(:title).and_return('Hello')
    allow(note).to receive(:body).and_return('world')
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
    allow(noteformatter).to receive(:format).and_return("Title: Hello\nworld")
    note = Note.new("WELLO","HORLD",noteformatter)
    expect(note.display).to eq("Title: Hello\nworld")
  end
end
