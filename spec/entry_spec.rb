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
    let(:comment_1) {double :comment_1}
    let(:comment_2) {double :comment_2}
    let(:connection) {double :connection}
    subject { described_class.new(id: 1, title: '22nd October 2018', body: 'This is the first entry') }
    it 'should return and array of comments' do
      allow(connection).to receive(:exec).and_return([comment_1, comment_2])
      allow(PostgresqlManager).to receive(:connect).and_return(connection)
      expect(subject.comments).to eq [comment_1, comment_2]
    end
  end

end
