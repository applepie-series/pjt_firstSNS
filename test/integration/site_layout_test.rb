require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get home_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", home_path, count: 2
    assert_select "a[href=?]", help_path
  end
end