require './book.rb'
require './student.rb'
require './teacher.rb'
require './rental.rb'
require './classroom.rb'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end
end