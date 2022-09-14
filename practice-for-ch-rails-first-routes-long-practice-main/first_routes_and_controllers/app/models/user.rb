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
        foreign_key: :viewer_id

    has_many :shared_artworks,
        through: :shares,
        source: :artwork
end
