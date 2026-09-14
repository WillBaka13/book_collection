require "rails_helper"

RSpec.describe Book, type: :model do
    it "accepts a title and rejects a blank title" do
        valid_book = Book.new(title: "The Hobbit")
        blank_book = Book.new(title: "")

        expect(valid_book).to be_valid
        expect(blank_book).not_to be_valid
    end

    it "stores an author" do
        book = Book.new(title: "The Hobbit", author: "J.R.R. Tolkien")

        expect(book.author).to eq("J.R.R. Tolkien")
    end

    it "stores a price" do
  book = Book.new(title: "The Hobbit", price: 19.99)

  expect(book.price).to eq(19.99)
end

    it "stores a published date" do
        date = Date.new(1937, 9, 21)
        book = Book.new(title: "The Hobbit", published_date: date)

        expect(book.published_date).to eq(date)
    end
end
