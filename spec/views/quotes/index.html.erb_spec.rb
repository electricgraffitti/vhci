require 'spec_helper'

describe "quotes/index.html.erb" do
  before(:each) do
    assign(:quotes, [
      stub_model(Quote,
        :service_id => 1,
        :page => "Page",
        :line_1 => "Line 1",
        :line_2 => "Line 2",
        :line_3 => "Line 3",
        :author => "Author",
        :line_count => 1
      ),
      stub_model(Quote,
        :service_id => 1,
        :page => "Page",
        :line_1 => "Line 1",
        :line_2 => "Line 2",
        :line_3 => "Line 3",
        :author => "Author",
        :line_count => 1
      )
    ])
  end

  it "renders a list of quotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Page".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Line 1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Line 2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Line 3".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
