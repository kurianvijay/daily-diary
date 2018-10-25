
describe 'Tag' do

  describe '.all' do
    it 'should return the tags' do
      expect(Tag.all.length).to be 6
    end
  end

  describe '.create' do
    it 'should return the tags' do
      tag = Tag.create(name: 'Fruit')
      expect(Tag.all.length).to eq 7
      expect(tag.name).to eq 'Fruit'
    end
  end

end
