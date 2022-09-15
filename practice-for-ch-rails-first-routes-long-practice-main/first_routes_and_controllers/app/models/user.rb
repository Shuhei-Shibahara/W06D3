# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :shares,
        class_name: :ArtworkShare,
        foreign_key: :viewer_id,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :comments,
        foreign_key: :author_id,
        dependent: :destroy,
        inverse_of: :author

    has_many :shared_artworks,
        through: :shares,
        source: :artwork

    has_many :likes,
        foreign_key: :liker_id,
        dependent: :destroy
end
