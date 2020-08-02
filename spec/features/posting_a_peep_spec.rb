feature 'Posting a peep' do
  scenario 'view posted peep' do
    User.create(
      username: 'FirstAuthor',
      email: 'test@makers.com',
      password: '12345'
    )
    visit('/peeps/new')
    fill_in('text', with: "New peep text")
    click_button('Post your Peep!')

    expect(page).to have_content("New peep text")
  end
end
