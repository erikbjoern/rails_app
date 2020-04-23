feature 'User can see a specific article' do
    before do
        create(:article, title: 'Breaking news!', content: 'Look at all these people breaking todays news.')
        create(:article, title: 'Broken news!', content: 'Today, some broken news was found in a back garden')

        visit root_path
    end
    
    it 'User sees list of articles' do
        expect(page).to have_content 'Broken news!'
    end
        
    context 'When article is clicked' do
        before do
            click_on 'Breaking news!'
        end

        it 'article title is displayed' do
            expect(page).to have_content 'Breaking news!'
        end
        
        it 'article content is displayed' do
            expect(page).to have_content 'Look at all these people breaking todays news.'
        end
    end
end