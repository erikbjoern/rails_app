require 'rails_helper'

feature 'List articles on index page' do
    context 'with articles in database' do
        before do
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