require 'spec_helper'

describe "admins/edit" do
  before(:each) do
    @admin = assign(:admin, stub_model(Admin,
      :NewHopeEmail => "MyString",
      :BridgesEmail => "MyString"
    ))
  end

  it "renders the edit admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do
      assert_select "input#admin_NewHopeEmail[name=?]", "admin[NewHopeEmail]"
      assert_select "input#admin_BridgesEmail[name=?]", "admin[BridgesEmail]"
    end
  end
end
