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

  def list_all_books
    @books&.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people&.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def list_all_rentals(id)
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Book: #{rental.book.title}, Person: #{rental.person.name}, Date: #{rental.date}"
      end
    end
  end
end