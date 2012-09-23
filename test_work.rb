class Work
  attr_accessor :composer, :title
  def show_info
    puts "Title and composer: #{@title}, #{@composer}"
  end
end

work = Work.new
work.composer = "Giuseppe Verdi"
work.title = "La Traviata"
work.show_info
