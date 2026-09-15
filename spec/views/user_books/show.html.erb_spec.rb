require "rails_helper"

RSpec.describe "user_books/show", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")
    book = Book.create!(title: "Test Book")

    assign(:user_book, UserBook.create!(
      user: user,
      book: book
    ))
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/Test User/)
    expect(rendered).to match(/Test Book/)
  end
end
