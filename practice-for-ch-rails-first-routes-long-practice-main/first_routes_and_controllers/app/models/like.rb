# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  liker_id     :bigint           not null
#  likable_type :string           not null
#  likable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Like < ApplicationRecord
    validates :likable_id, :liker_id, presence: true 
    validates :likable_id, uniqueness: {scope: [:liker_id, :likable_type]}

    belongs_to :liker,
        class_name: :User

    belongs_to :likable,
        polymorphic: true 
end
