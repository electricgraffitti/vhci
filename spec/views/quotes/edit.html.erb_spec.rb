require 'spec_helper'

describe "quotes/edit.html.erb" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :service_id => 1,
      :page => "MyString",
      :line_1 => "MyString",
      :line_2 => "MyString",
      :line_3 => "MyString",
      :author => "MyString",
      :line_count => 1
    ))
  end

  it "renders the edit quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quote_path(@quote), :method => "post" do
      assert_select "input#quote_service_id", :name => "quote[service_id]"
      assert_select "input#quote_page", :name => "quote[page]"
      assert_select "input#quote_line_1", :name => "quote[line_1]"
      assert_select "input#quote_line_2", :name => "quote[line_2]"
      assert_select "input#quote_line_3", :name => "quote[line_3]"
      assert_select "input#quote_author", :name => "quote[author]"
      assert_select "input#quote_line_count", :name => "quote[line_count]"
    end
  end
end
