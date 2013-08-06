require 'spec_helper'

describe "playlists/edit" do
  before(:each) do
    @playlist = assign(:playlist, stub_model(Playlist,
      :playlist_id => "MyString",
      :uid => "MyString"
    ))
  end

  it "renders the edit playlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", playlist_path(@playlist), "post" do
      assert_select "input#playlist_playlist_id[name=?]", "playlist[playlist_id]"
      assert_select "input#playlist_uid[name=?]", "playlist[uid]"
    end
  end
end
