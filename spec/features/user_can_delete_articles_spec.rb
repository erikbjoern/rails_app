feature 'User can delete articles' do
    context "- With articles in database, when 'Delete Article' is clicked" do
        let(:article) { create(:article, title: 'To be deleted', content: 'Never to be read again.') }
        
        before do
            visit article_path(article.id)
            click_on 'Delete Article'
        end   
        
        it 'article title is not displayed' do
            expect(page).not_to have_content 'To be deleted'
        end

        it 'article content is not displayed' do
            expect(page).not_to have_content 'Never to be read again.'
        end

        it 'a confirmation message is displayed' do
            expect(page).to have_content 'Your article was successfully deleted.'
        end
    end
end
