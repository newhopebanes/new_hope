require 'spec_helper'

describe "admins/show" do
  before(:each) do
    @admin = assign(:admin, stub_model(Admin,
      :NewHopeEmail => "New Hope Email",
      :BridgesEmail => "Bridges Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/New Hope Email/)
    rendered.should match(/Bridges Email/)
  end
end
