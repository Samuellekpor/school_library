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
      puts "[#{person.class}] - ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
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

  def create_a_teacher(specialization:, age:, name:, parent_permission: true)
    @people.push(Teacher.new(specialization: specialization, age: age, name: name, parent_permission: parent_permission))
  end

  def create_a_student(classroom:nil, age:, name:, parent_permission: true)
    @people.push(Teacher.new(classroom: classroom, age: age, name: name, parent_permission: parent_permission))
  end

  def create_a_book(title:, author:)
    @books.push(Book.new(title: title, author: author))
  end

  def create_a_rental(date:, person:, book:)
    @rentals.push(Rental.new(date: date, person: person, book: book))
  end
end
