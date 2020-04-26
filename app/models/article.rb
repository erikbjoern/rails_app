class Article < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :content
    validates_presence_of :author_id
    belongs_to :user
end
