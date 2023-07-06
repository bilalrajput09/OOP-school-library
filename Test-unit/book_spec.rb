require './book'

RSpec.describe Book do
  book = Book.new('title', 'author')

  context '#initialize' do
    it 'should initialize a book' do
      expect(book.rentals).to be_empty
      expect(book.title).to eql 'title'
      expect(book.author).to eql 'author'
    end
  end

  context '#add_rental' do
    it 'should add a rental' do
      first_rental = double('rental')
      second_rental = double('rental')
      allow(first_rental).to receive(:book=)
      allow(second_rental).to receive(:book=)

      book.add_rental(first_rental)
      book.add_rental(second_rental)

      expect(book.rentals.length).to eql 2
    end
  end
end
