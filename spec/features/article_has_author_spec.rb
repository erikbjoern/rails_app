feature 'Article has author' do
    let(:author) { create(:user, email: "author@of_article.com") }
    context 'when created by user' do
        before do
            login_as(author, scope: :user)
            visit new_article_path
            fill_in 'Title', with: 'The Title'
            fill_in 'Content', with: 'The content.'
            click_on 'Create Article'
        end

        it 'Articles author is user' do
            article = Article.find_by(title: 'The Title')
            binding.pry
            expect(@article.user_id).to eq author.id
        end
    end
end