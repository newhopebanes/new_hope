require 'spec_helper'

describe "links/show" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :name => "Name",
      :url => "Url",
      :phone => "Phone",
      :location => "Location",
      :opening => "Opening",
      :text => "Text",
      :link_type_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/Phone/)
    rendered.should match(/Location/)
    rendered.should match(/Opening/)
    rendered.should match(/Text/)
    rendered.should match(/1/)
  end
end
