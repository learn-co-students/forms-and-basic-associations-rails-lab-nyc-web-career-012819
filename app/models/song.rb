class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    # byebug
    self.artist = Artist.find_or_create_by(:name => name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    #
    self.genre = Genre.find_or_create_by(:name => name)
  end

  def genre_name
    # binding.pry
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
      # if content.length > 0
        word = Note.find_or_create_by(content: content)
        self.notes << word
      end
    end
  end

  def note_contents
    # binding.pry
    self.notes.collect(&:content)
  end

end
