require './app'

def create_a_student(app)
  puts 'Name :'
  name = gets.chomp
  puts 'Age : '
  age = gets.chomp.to_i
  puts 'Has parents permission? (y/n)'
  parent_permission = gets.chomp.downcase == 'y'
  app.create_a_student(age:, name:, parent_permission:)
  puts 'Student created successfully!'
end

def create_a_teacher(app)
  puts 'Name : '
  name = gets.chomp
  puts 'Age : '
  age = gets.chomp.to_i
  puts 'Specialization : '
  specialization = gets.chomp
  app.create_a_teacher(specialization:, age:, name:, parent_permission: true)
  puts 'Teacher created successfully!'
end

def create_a_book(app)
  puts 'Title : '
  title = gets.chomp
  puts 'Author : '
  author = gets.chomp
  app.create_a_book(title:, author:)
  puts 'Book created successfully!'
end

def create_a_rental(app)
  puts 'Select a book from the following list by number : '
  app.books.each_with_index do |book, index|
    puts "#{index}. Title: #{book.title}, Author: #{book.author}"
  end
  id_book = gets.chomp
  book = app.books[id_book.to_i]

  puts 'Select a person from the following list by number (not id) : '
  app.people.each_with_index do |person, index|
    puts "#{index}. [#{person.class}] - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  id_person = gets.chomp
  person = app.people[id_person.to_i]

  puts 'Date : '
  date = gets.chomp
  app.create_a_rental(date:, person:, book:)
  puts 'Rental created sucessfully!'
end

def person_info(app)
  puts 'ID of the person'
  app.people.each_with_index do |person, index|
    puts "#{index}. [#{person.class}] - Name: #{person.name} ID: #{person.id} Age: #{person.age}"
  end
  id = gets.chomp
  app.list_all_rentals(id.to_i)
end

def list_options(app, input)
  puts input
  case input
  when 1
    puts 'List of books'
    app.list_all_books
  when 2
    puts 'List of people'
    app.list_all_people
  else
    puts 'Invalid input!'
  end
end

def check_input_create_people(app)
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
  input = gets.chomp.to_i
  case input
  when 1
    create_a_student(app)
  when 2
    create_a_teacher(app)
  else
    puts 'Invalid input!'
  end
end

def create_options(app, input)
  case input
  when 3
    check_input_create_people(app)
  when 4
    create_a_book(app)
  when 5
    create_a_rental(app)
  end
end

def check_input(app, input)
  case input
  when 1..2
    list_options(app, input)
  when 3..5
    create_options(app, input)
  when 6
    person_info(app)
  when 7
    puts 'Thank you for using this app!'
    raise StopIteration
  else
    puts "You input #{input}"
  end
end

def main
  app = App.new
  loop do
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    input = gets.chomp.to_i
    check_input(app, input)
  end
end

main
