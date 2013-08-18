require 'spec_helper'

describe "admins/index" do
  before(:each) do
    assign(:admins, [
      stub_model(Admin,
        :NewHopeEmail => "New Hope Email",
        :BridgesEmail => "Bridges Email"
      ),
      stub_model(Admin,
        :NewHopeEmail => "New Hope Email",
        :BridgesEmail => "Bridges Email"
      )
    ])
  end

  it "renders a list of admins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "New Hope Email".to_s, :count => 2
    assert_select "tr>td", :text => "Bridges Email".to_s, :count => 2
  end
end
