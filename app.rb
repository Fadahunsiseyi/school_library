require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each { |b| puts "Title: #{b.title}, Author: #{b.author}" }
  end

  def list_all_people
    @people.each { |p| puts "[#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" }
  end

  def parent_permission?
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'Please enter a valid input'
      parent_permission?
    end

    parent_permission
  end

  def person_choice
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    answer = gets.chomp.to_i
    if [1, 2].include?(answer)
      answer
    else
      puts 'Please enter a valid value (1 or 2)'
      person_choice
    end
  end

  def create_a_person
    answer = person_choice
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case answer
    when 1
      parent_permission = parent_permission?
      @people << Student.new(age, name, parent_permission)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(specialization, age, name)
    end
    puts 'Person created successfully'
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts 'Book created successfully'
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |b, i| puts "#{i}) Title: #{b.title}, Author: #{b.author}" }
    index = gets.to_i
    book = @books[index]

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |p, i| puts "#{i}) [#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" }
    index = gets.to_i
    person = @people[index]

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    rental.add_book(book, person)
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_all_rentals_for_a_given_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    person = @people.select { |p| p.id == id }

    puts 'Rentals:'
    person[0].rentals.each do |r|
      puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}"
    end
  end

  def query_method
    puts "Please choose an option by entering a number: \n
    1 - List all books \n
    2 - List all people \n
    3 - Create a person \n
    4 - Create a book \n
    5 - Create a rental \n
    6 - List all rentals for a given person id \n
    7 - exit "
    gets.to_i
  end

  def return_method(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals_for_a_given_person_id
    end
  end

  def return_error
    puts 'Please enter a valid input'
  end
end