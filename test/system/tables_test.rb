require "application_system_test_case"

class TablesTest < ApplicationSystemTestCase
  setup do
    @table = tables(:one)
  end

  test "visiting the index" do
    visit tables_url
    assert_selector "h1", text: "Tables"
  end

  test "creating a Table" do
    visit tables_url
    click_on "New Table"

    fill_in "Bmi", with: @table.bmi
    fill_in "Bone", with: @table.bone
    fill_in "Fat", with: @table.fat
    fill_in "Height", with: @table.height
    fill_in "Metabolism", with: @table.metabolism
    fill_in "Moisture", with: @table.moisture
    fill_in "Muscle", with: @table.muscle
    fill_in "Name", with: @table.name
    fill_in "Visceral fat", with: @table.visceral_fat
    fill_in "Weight", with: @table.weight
    click_on "Create Table"

    assert_text "Table was successfully created"
    click_on "Back"
  end

  test "updating a Table" do
    visit tables_url
    click_on "Edit", match: :first

    fill_in "Bmi", with: @table.bmi
    fill_in "Bone", with: @table.bone
    fill_in "Fat", with: @table.fat
    fill_in "Height", with: @table.height
    fill_in "Metabolism", with: @table.metabolism
    fill_in "Moisture", with: @table.moisture
    fill_in "Muscle", with: @table.muscle
    fill_in "Name", with: @table.name
    fill_in "Visceral fat", with: @table.visceral_fat
    fill_in "Weight", with: @table.weight
    click_on "Update Table"

    assert_text "Table was successfully updated"
    click_on "Back"
  end

  test "destroying a Table" do
    visit tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Table was successfully destroyed"
  end
end
