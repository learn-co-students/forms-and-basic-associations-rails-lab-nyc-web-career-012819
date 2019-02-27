class Genre < ActiveRecord::Base
  # add associations
  has_many :songs

  # def song_genre_id=(ids)
  #   ids.each do |id|
  #     genre = Genre.find(id)
  #     self.songs << genre
  #   end
  # end
end
