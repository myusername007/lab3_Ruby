require "application_system_test_case"

class CastlesTest < ApplicationSystemTestCase
  setup do
    @castle = castles(:one)
  end

  test "visiting the index" do
    visit castles_url
    assert_selector "h1", text: "Castles"
  end

  test "should create castle" do
    visit castles_url
    click_on "New castle"

    fill_in "Built year", with: @castle.built_year
    fill_in "Description", with: @castle.description
    fill_in "Image url", with: @castle.image_url
    fill_in "Name", with: @castle.name
    fill_in "Region", with: @castle.region
    click_on "Create Castle"

    assert_text "Castle was successfully created"
    click_on "Back"
  end

  test "should update Castle" do
    visit castle_url(@castle)
    click_on "Edit this castle", match: :first

    fill_in "Built year", with: @castle.built_year
    fill_in "Description", with: @castle.description
    fill_in "Image url", with: @castle.image_url
    fill_in "Name", with: @castle.name
    fill_in "Region", with: @castle.region
    click_on "Update Castle"

    assert_text "Castle was successfully updated"
    click_on "Back"
  end

  test "should destroy Castle" do
    visit castle_url(@castle)
    click_on "Destroy this castle", match: :first

    assert_text "Castle was successfully destroyed"
  end
end
