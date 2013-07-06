require 'spec_helper'

describe "links/index" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :name => "Name",
        :url => "Url",
        :phone => "Phone",
        :location => "Location",
        :opening => "Opening",
        :text => "Text",
        :link_type_id => 1
      ),
      stub_model(Link,
        :name => "Name",
        :url => "Url",
        :phone => "Phone",
        :location => "Location",
        :opening => "Opening",
        :text => "Text",
        :link_type_id => 1
      )
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Opening".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
