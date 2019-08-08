require 'diary'

describe Entry do
  subject(:test_entry) { Entry.new('Hello','world') }
  it 'stores and shows a title' do
    expect(subject.title).to eq('Hello')
  end
  it 'stores and shows a body' do
    expect(subject.body).to eq('world')
  end
end

describe Diary do
  let(:entry) { double(:entry, title: 'Hello', body: 'world') }
  let(:another_entry) { double(:another_entry, title: 'Foo', body: 'bar') }
  it 'adds an entry' do
    expect(subject).to respond_to(:add).with(1).arguments
  end
  it 'returns a list of titles on each line' do
    subject.add(entry)
    subject.add(another_entry)
    expect(subject.index).to eq("Hello\nFoo")
  end
end
