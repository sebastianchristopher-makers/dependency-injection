class Note
  attr_reader :title, :body

  def initialize(title, body)
    @title = title
    @body = body
    @formatter = NoteFormatter.new
  end

  def display
    @formatter.format(self)
  end

end

class NoteFormatter
  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end
