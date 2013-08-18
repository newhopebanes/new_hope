require 'spec_helper'

describe "admins/new" do
  before(:each) do
    assign(:admin, stub_model(Admin,
      :NewHopeEmail => "MyString",
      :BridgesEmail => "MyString"
    ).as_new_record)
  end

  it "renders new admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admins_path, "post" do
      assert_select "input#admin_NewHopeEmail[name=?]", "admin[NewHopeEmail]"
      assert_select "input#admin_BridgesEmail[name=?]", "admin[BridgesEmail]"
    end
  end
end
