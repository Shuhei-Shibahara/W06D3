# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :artist_id, :image_url, :title, presence: true
    validates :artist_id, uniqueness: {scope: :title}

    def self.artworks_for_user_id(id)
        [:]
    end

    belongs_to :artist,
    class_name: :User

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

end
