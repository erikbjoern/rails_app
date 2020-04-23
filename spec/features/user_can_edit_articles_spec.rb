feature 'User can edit articles' do
    context '- With articles in database' do
        let(:article) { create(:article, title: 'To be edited', content: 'Ever to be read again.') }
        
        before do
            visit article_path(article.id)
            click_on 'Edit Article'
        end

        it 'user can edit title' do
            fill_in 'article_title', with: 'This is edited'
            click_on 'Save'
            expect(page).to have_content 'This is edited'
        end

        it 'user can edit content' do
            fill_in 'article_content', with: 'Never to be edited again.'
            click_on 'Save'
            expect(page).to have_content 'Never to be edited again.'
        end

        it 'user gets a confirmation message when edit is saved' do
            fill_in 'article_title', with: 'To be confirmed'
            click_on 'Save'
            expect(page).to have_content 'Your changes was successfully saved.'
        end
    end
end