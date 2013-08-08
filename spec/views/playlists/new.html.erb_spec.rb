require 'spec_helper'

describe "playlists/new" do
  before(:each) do
    assign(:playlist, stub_model(Playlist,
      :playlist_id => "MyString",
      :uid => "MyString"
    ).as_new_record)
  end

  it "renders new playlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", playlists_path, "post" do
      assert_select "input#playlist_playlist_id[name=?]", "playlist[playlist_id]"
      assert_select "input#playlist_uid[name=?]", "playlist[uid]"
    end
  end
end
