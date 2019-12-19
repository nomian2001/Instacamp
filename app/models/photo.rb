class Photo < ApplicationRecord
    validates :username, :url, presence: true
end
