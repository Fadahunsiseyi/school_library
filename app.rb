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

 
end