require'postgresql_manager'
require 'comment'


describe Comment do
  describe '#initialize' do
    subject {described_class.new(id: 1, body: 'Test comment', entry_id: 1)}
    it 'should have a body and id' do
      expect(subject.id).to eq 1
      expect(subject.entry_id).to eq 1
      expect(subject.body).to eq 'Test comment'
    end
  end

  describe '.create' do
    it 'should add comment to database and return comment object' do
      comment = Comment.create('Test comment', 2)
      query_result = PostgresqlManager.query "Select * FROM Comments WHERE entry_id=2;"
      db_comment = query_result[0]
      expect(query_result.count).to eq 1
      expect(db_comment['body']).to eq 'Test comment'
      expect(db_comment['entry_id']).to eq "2"
    end
  end

end
