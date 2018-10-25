require 'entry'

describe Entry do
  describe '#initialize' do
    subject { described_class.new(id: 1, title: '22nd October 2018', body: 'This is the first entry') }
    it 'should have an id' do
      expect(subject.id).to eq 1
    end
    it 'should have a title' do
      expect(subject.title).to eq '22nd October 2018'
    end
    it 'should have a body' do
      expect(subject.body).to eq 'This is the first entry'
    end
  end

  describe '#comments' do
    subject { described_class.get(1) }
    it 'should return and array of comments' do
      comments = subject.comments
      expect(comments.length).to eq 3
      expect(comments[0].body).to eq 'Fist comment'
    end
  end

  describe '#tags' do
    subject { described_class.get(1) }
    it 'should return an array of the tags for the entry' do
      tags = subject.tags
      expect(tags.length).to eq 3
      expect(tags[0].name).to eq 'Happy'
    end
  end

  describe '::filter_by_tag' do
    it 'should filter by tag category' do
      entries = Entry.filter_by_tag(1)
      expect(entries.length).to eq 1
      expect(entries[0].id).to eq '1'
    end
  end

end
