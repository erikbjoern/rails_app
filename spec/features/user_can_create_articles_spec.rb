feature 'User can create articles' do
    before do
        visit root_path
        click_on 'New Article'
    end

    context 'User can successfully create an article [Happy Path]' do
        before do
            fill_in 'article_title', with: 'Happy holidays'
            fill_in 'article_content', with: 'Buy your gifts now!'
            click_on 'commit'
        end

        it 'User should be on article show page' do
            article = Article.find_by(title: 'Happy holidays')
            expect(current_path).to eq article_path(article)
        end

        it 'User should see a success message' do
            expect(page).to have_content 'Your article was successfully created.'
        end
        
        it 'User should see article' do
            expect(page).to have_content 'Happy holidays'
        end
        
        it 'User should see article content' do
            expect(page).to have_content 'Buy your gifts now!'
        end
    end

    context "User doesn't enter a title for the article [Sad Path]" do
        before do
            fill_in 'article_text', with: 'Buy your gifts now!'
            click_on 'commit'
        end

        it 'User should see error message' do
            expect(page).to have_content 'Your article needs a title.'
        end
    end 

    context "User doesn't enter content for the article [Sad Path]" do
        before do
            fill_in 'article_title', with: 'Happy holidays'
            click_on 'commit'
        end
    
        it 'User should see error message' do
            expect(page).to have_content 'Your article needs content.'
        end
    end 
    
    context "User doesn't enter anything at all [Sad Path]" do
        before do
            click_on 'commit'
        end
    
        it 'User should see error message' do
            expect(page).to have_content 'Your article needs a title and content.'
        end
    end 
end