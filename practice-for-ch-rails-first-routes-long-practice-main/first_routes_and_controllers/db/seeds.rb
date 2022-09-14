# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 

puts "\e[2J\e[f"
puts "destroying tables"
Artwork.destroy_all
User.destroy_all
ArtworkShare.destroy_all

%w(artworks users artworkshares artwork_shares).each do |ele|
    ApplicationRecord.connection.reset_pk_sequence!(ele)
end

puts 'Creating seed data'
u1 = User.create!(username: 'willynilly')
u2 = User.create!(username: 'chrischeastyfangirl')
u3 = User.create!(username: 'moses123')
u4 = User.create!(username: 'shoobydooby')
u5 = User.create!(username: 'fakewill')

a1 = Artwork.create!(title: 'MonaLouise', image_url: 'data:image/jpeg;base64,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', artist_id: u1.id )
a2 = Artwork.create!(title: 'Sharkytime', image_url: 'data:image/jpeg;base64,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', artist_id: u2.id)
a3 = Artwork.create!(title: 'camethrutrippin', image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxofvFvqO6OE0dReAIeAWFjpbfZKeTHqCO0w&usqp=CAU', artist_id: u3.id)

as1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u5.id)
as2 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u2.id)
as3 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u5.id)
as4 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u4.id)
as5 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u5.id)

end