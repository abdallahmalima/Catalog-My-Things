require 'rspec'
require('./item')
require('./book')

RSpec.describe Book do
  let(:book) { Book.new(1, '2011-01-24', true, 'Abdallah', 'good') }

  describe '#initialize' do
    it 'sets the book id, publish date, archive status, publisher and cover state' do
      expect(book.id).to eq(1)
      expect(book.publish_date).to eq('2011-01-24')
      expect(book.archived).to be_truthy
      expect(book.publisher).to eq('Abdallah')
      expect(book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the cover state is "bad"' do
      book.cover_state = 'bad'
      expect(book.send(:can_be_archived?)).to be_truthy
    end

    it 'calls the super method if the cover state is not "bad"' do
      allow(book).to receive(:cover_state).and_return('good')
      expect(book.send(:can_be_archived?)).to be_truthy
    end
  end
end
