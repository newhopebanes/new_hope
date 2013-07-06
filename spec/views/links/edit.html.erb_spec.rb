require 'spec_helper'

describe "links/edit" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :name => "MyString",
      :url => "MyString",
      :phone => "MyString",
      :location => "MyString",
      :opening => "MyString",
      :text => "MyString",
      :link_type_id => 1
    ))
  end

  it "renders the edit link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", link_path(@link), "post" do
      assert_select "input#link_name[name=?]", "link[name]"
      assert_select "input#link_url[name=?]", "link[url]"
      assert_select "input#link_phone[name=?]", "link[phone]"
      assert_select "input#link_location[name=?]", "link[location]"
      assert_select "input#link_opening[name=?]", "link[opening]"
      assert_select "input#link_text[name=?]", "link[text]"
      assert_select "input#link_link_type_id[name=?]", "link[link_type_id]"
    end
  end
end
