require 'entry_tag'

describe 'EntryTag' do
  describe '.create' do
    it 'should create an entry tag' do
      entry_tag = EntryTag.create(2, 1)
      expect(entry_tag.entry_id).to eq '2'
      expect(entry_tag.tag_id).to eq '1'
    end
  end

  describe '.all' do
    it 'should return all entry tags' do
      expect(EntryTag.all.length).to equal 3
    end
  end

  describe '.update' do
    it 'should change the number of tags on an entry' do
      EntryTag.update(1, [4,5])
      expect(EntryTag.all.length).to eq 2
    end
  end

end
