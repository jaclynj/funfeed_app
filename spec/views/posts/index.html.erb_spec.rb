require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :content => "MyText",
        :media_type => "Media Type"
      ),
      stub_model(Post,
        :content => "MyText",
        :media_type => "Media Type"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Media Type".to_s, :count => 2
  end
end
