feature 'Viewing peeps' do
  scenario 'user wants to see peeps in reverse chronological order' do
    Peep.create('First test peep')
    Peep.create('Second test peep')
    visit('/peeps')
    
    expect(page).to have_content('First test peep')
    expect(page).to have_content('Second test peep')
    expect(first('.peep')).to have_content 'Second test peep'
  end

  scenario 'user wants to see time peep was posted' do
    allow(DatabaseConnection).to receive(:query) { "2020-08-01 17:26:00+01" }
    allow(DatabaseConnection).to receive(:query).with("First test peep") {}
    Peep.create('First test peep')
    visit('/peeps')
    expect(page).to have_content('2020-08-01 17:26:00+01')
  end
end