class Room < ApplicationRecord
  belongs_to :user
  attachment :image

  with_options presence: true do
    validates :title
    validates :genre
    validates :age
    validates :content
    validates :purpose
  end
end
