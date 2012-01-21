require 'spec_helper'

describe "quotes/show.html.erb" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :service_id => 1,
      :page => "Page",
      :line_1 => "Line 1",
      :line_2 => "Line 2",
      :line_3 => "Line 3",
      :author => "Author",
      :line_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Page/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Line 1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Line 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Line 3/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Author/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
