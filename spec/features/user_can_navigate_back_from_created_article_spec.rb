feature 'User can navigate the app' do
    context 'from newly created article' do
        before do
            create(:article, title: 'Breaking news!', content: 'Look at all these people breaking todays news.')

            visit root_path
            click_on 'New Article'
            fill_in 'article_title', with: 'A new title'
            fill_in 'article_content', with: 'With new content!'
            click_on 'commit'
        end

        it 'displaying the article' do
            expect(page).to have_content 'A new title'    
        end
    end

    context 'back to index of articles' do
        before do
            click_on 'To start page'
        end
        
        it 'displaying also previously existing article title' do
            expect(page).to have_content 'Breaking news!'
        end

        it 'but not its content' do
            expect(page).not_to have_content 'Look at all these people breaking todays news.'
        end
    end

    context 'into a specific article' do
        before do
            click_on 'Breaking news!'
        end

        it 'displaying its title' do
            expect(page).to have_content 'Breaking news!'
        end

        it 'and its content' do
            expect(page).to have_content 'Look at all these people breaking todays news.'
        end
    end
end