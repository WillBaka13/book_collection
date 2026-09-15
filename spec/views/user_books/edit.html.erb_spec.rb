require 'rails_helper'

RSpec.describe "user_books/edit", type: :view do
  let(:user) { User.create!(username: "Test User") }
    let(:book) { Book.create!(title: "Test Book") }

    let(:user_book) do
      UserBook.create!(
        user: user,
        book: book
      )
    end

    before(:each) do
      assign(:user_book, user_book)
    end

  it "renders the edit user_book form" do
    render

    assert_select "form[action=?][method=?]", user_book_path(user_book), "post" do
      assert_select "select[name='user_book[user_id]']"
      assert_select "select[name='user_book[book_id]']"
    end
  end
end
