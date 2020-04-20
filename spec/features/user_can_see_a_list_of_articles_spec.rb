require 'rails_helper'

feature 'List articles on index page' do
    context 'with articles in database' do
        before do
            create(:article, title: 'Breaking news!')
            create(:article, title: 'Broken news!')

            visit root_path
        end

        it 'displays first article title' do
            expect(page).to have_content 'Breaking news!'
        end

        it 'displays second article title' do
            expect(page).to have_content 'Broken news!'
        end
    end
end