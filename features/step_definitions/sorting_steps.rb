Given("I am on the sorting page") do
    @sorting_page.url
    expect(@sorting_page).to have_selector("div[id='app']")
end
  
When("I sort the rows in ascending order") do
    @sorting_page.sortAscending
end

Then("the items are shown in ascending order") do
    @sorting_page.findItems
    puts "After sorting: #{$arrayItems}"
    expect($arrayItems).to eq($ascendingInitial)
end