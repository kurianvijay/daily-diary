require 'comment'

describe Comment do
  describe '#initialize' do
    subject {described_class.new(id: 1, body: 'Test comment')}
    it 'should have a body and id' do
      expect(subject.id).to eq 1
      expect(subject.body).to eq 'Test comment'
    end
  end
end
