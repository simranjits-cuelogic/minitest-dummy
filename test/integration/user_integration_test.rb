require "test_helper"

describe "User integration" do
  it "show content on page " do
    visit dashboard_index_path
    page.text.must_include "show"
  end
end