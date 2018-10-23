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
end
