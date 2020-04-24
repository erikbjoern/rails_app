feature 'User can navigate the app' do
    before do
        create(:article, title: 'Breaking news!', content: 'Look at all these people breaking todays news.')

        visit root_path
        click_on 'New Article'
        fill_in 'article_title', with: 'A new title'
        fill_in 'article_content', with: 'With new content!'
        click_on 'commit'
    end
    
    context 'from newly created article' do
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
            click_on 'To start page'
            click_on 'Breaking news!'
        end
        
        it 'displaying its title' do
            expect(page).to have_content 'Breaking news!'
        end
        
        it 'and its content' do
            expect(page).to have_content 'Look at all these people breaking todays news.'
        end
    end
    
    context 'into the editing view for the article' do
        before do
            click_on 'To start page'
            click_on 'Breaking news!'
            click_on 'Edit Article'
        end

        it 'displaying field for editing the title' do
            expect(page).to have_content 'Title'            
        end

        it 'displaying field for editing the content' do
            expect(page).to have_content 'Content'            
        end
    end
    
    context 'back to displaying the specific article' do
        before do
            click_on 'To start page'
            click_on 'Breaking news!'
            click_on 'Edit Article'
            click_on 'Back (discard changes)'
        end
        
        it 'displaying the articles content' do
            expect(page).to have_content 'Look at all these people breaking todays news.'
        end
        
        it 'but not the field for editing it' do
            expect(page).not_to have_content 'Content'            
        end
    end

    context 'back to the index of articles' do
        before do
            click_on 'To start page'
            click_on 'Breaking news!'
            click_on 'To start page'
        end

        it 'displaying the second title' do
            expect(page).to have_content 'A new title'
        end
        
        it 'but not its content.' do
            expect(page).not_to have_content 'With new content!'
        end
    end

    context 'Directly from the editing view back to the start page' do
        before do 
            click_on 'To start page'
            click_on 'Breaking news!'
            click_on 'Edit Article'
            click_on 'To start page (discard changes)'
        end

        it 'displaying the unedited title' do
            expect(page).to have_content 'Breaking news!'
        end
        
        it 'but not its content.' do
            expect(page).not_to have_content 'Look at all these people breaking todays news.'
        end
    end 
end
