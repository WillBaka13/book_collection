require "rails_helper"

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(username: "User One"),
      User.create!(username: "User Two")
    ])
  end

  it "renders a list of users" do
    render

    expect(rendered).to include("User One")
    expect(rendered).to include("User Two")
  end
end
