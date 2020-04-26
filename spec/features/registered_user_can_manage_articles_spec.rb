feature 'registered user can manage articles' do
    before do
        create(:article, title: 'Breaking news!', content: 'Look at all these people breaking todays news.')
    end

    context 'registered user' do
        let(:user) { create(:user) }
        before do
            login_as(user, scope: :user)
            visit root_path
        end
            
        it 'can create article' do
            click_on 'New Article'
            fill_in 'article_title', with: 'The Title'
            fill_in 'article_content', with: 'The content.'
            click_on 'commit'
            expect(page).to have_content 'Your article was successfully created.'
        end

        it 'can edit article' do
            article = Article.find_by_title('Breaking news!')
            visit article_path(article)
            click_on 'Edit Article'
            fill_in 'article_title', with: 'This is edited'
            click_on 'Save'
            expect(page).to have_content 'This is edited'
        end

        it 'can delete article' do
            article = Article.find_by_title('Breaking news!')
            visit article_path(article)
            click_on 'Delete Article'
            expect(page).to have_content 'Your article was successfully deleted.'
        end
    end

    context 'unregistered user' do
        
        it 'cannot see link to create new article on index page' do
            visit root_path
            expect(page).not_to have_content 'New Article'
        end

        it 'cannot see link to edit article on article page' do
            article = Article.find_by_title('Breaking news!')
            visit article_path(article)
            expect(page).not_to have_content 'Edit Article'  
        end
        
        it 'cannot see link to delete article on article page' do
            article = Article.find_by_title('Breaking news!')
            visit article_path(article)
            expect(page).not_to have_content 'Delete Article'  
        end
    end

    context 'unregistered user with direct path' do
        it 'cannot acces create method' do
            visit new_article_path
            expect(page).to have_content 'You need to sign in or sign up before continuing.'
        end

        it 'cannot perform edit method' do
            article = Article.find_by_title('Breaking news!')
            visit article_path(article)
            expect(page).to have_content 'You need to sign in or sign up before continuing.'
        end

        it 'cannot perform delete method' do
            article = Article.find_by_title('Breaking news!')
            visit article_path(article)
            expect(page).to have_content 'You need to sign in or sign up before continuing.'
        end
    end
end