require 'spec_helper'

describe "artists/new" do
  before(:each) do
    assign(:artist, stub_model(Artist,
      :fund_sender_id => 1,
      :fund_receiver_id => 1
    ).as_new_record)
  end

  it "renders new artist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", artists_path, "post" do
      assert_select "input#artist_fund_sender_id[name=?]", "artist[fund_sender_id]"
      assert_select "input#artist_fund_receiver_id[name=?]", "artist[fund_receiver_id]"
    end
  end
end
