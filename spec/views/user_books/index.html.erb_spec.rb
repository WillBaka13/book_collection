require "rails_helper"

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")
    book = Book.create!(title: "Test Book")

    assign(:user_books, [
      UserBook.create!(user: user, book: book),
      UserBook.create!(user: user, book: book)
    ])
  end

  it "renders a list of user_books" do
    render

    expect(rendered.scan("Test User").count).to eq(2)
    expect(rendered.scan("Test Book").count).to eq(2)
  end
end
