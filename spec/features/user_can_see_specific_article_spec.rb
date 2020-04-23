feature 'User can see a specific article' do
    before do
        create(:article, title: 'Breaking news!', content: 'Look at all these people breaking todays news.')
        create(:article, title: 'Broken news!', content: 'Today, some broken news was found in a back garden')

        visit root_path
        click_on 'Breaking news!'
    end

    context 'Article displays' do
        it 'title' do
            expect(page).to have_content 'Breaking news!'
        end
        
        it 'content' do
            expect(page).to have_content 'Look at all these people breaking todays news.'
        end
    end
end