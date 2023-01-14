require './book'
require './student'
require './teacher'
require './rental'
require './classroom'

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
    @people.push(Teacher.new(specialization: specialization, age: age, name: name,
                             parent_permission: parent_permission))
  end

  def create_a_student(age:, name:, classroom: nil, parent_permission: true)
    @people.push(Student.new(classroom:, age:, name:, parent_permission:))
  end

  def create_a_book(title:, author:)
    @books.push(Book.new(title:, author:))
  end

  def create_a_rental(date:, person:, book:)
    @rentals.push(Rental.new(date:, person:, book:))
  end
end

app = App.new
app.list_all_books