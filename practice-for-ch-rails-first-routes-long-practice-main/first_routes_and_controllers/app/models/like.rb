class Like < ApplicationRecord
    validates :likable_id, :liker_id, presence: true 
    validates [:likable_id, :liker_id], uniqueness: true 

    belongs_to :liker,
        class_name: :User

    belongs_to :likable
        polymorphic: true 
end
