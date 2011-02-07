Given /^the following games:$/ do |games|
  Game.create!(games.hashes)
end

Given /^a game named "([^"]*)" exists$/ do |name|
  Game.create! :name => name
end

Given /^I have a game named "([^"]*)"$/ do |name|
  @user.games.create! :name => name
end

When /^I delete the (\d+)(?:st|nd|rd|th) game$/ do |pos|
  visit games_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following games:$/ do |expected_games_table|
  expected_games_table.diff!(tableish('table tr', 'td,th'))
end
