require "rails_helper"

RSpec.describe "Books", type: :request do
    it "adds a book with a title and rejects a blank title with flash messages" do
        expect {
            post books_path, params: { book: { title: "The Hobbit" } }
        }.to change(Book, :count).by(1)

        expect(response).to redirect_to(books_path)
        expect(flash[:notice]).to eq("Book was successfully added.")

        expect {
            post books_path, params: { book: { title: "" } }
        }.not_to change(Book, :count)

        expect(flash[:alert]).to eq("Title can't be blank")
    end

    it "adds a book with an author" do
        post books_path, params: {
            book: { title: "The Hobbit", author: "J.R.R. Tolkien" }
        }

        book = Book.last
        expect(book.author).to eq("J.R.R. Tolkien")
    end

    it "adds a book with a price" do
        post books_path, params: {
            book: { title: "The Hobbit", price: 19.99 }
        }

        book = Book.last
        expect(book.price).to eq(19.99)
    end

    it "adds a book with a published date" do
        post books_path, params: {
            book: { title: "The Hobbit", published_date: "1937-09-21" }
        }

        book = Book.last
        expect(book.published_date).to eq(Date.new(1937, 9, 21))
    end
end
