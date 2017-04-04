require 'pry'
require 'rest-client'
require 'json'

# Write an application that takes in a search term from the user

def fetch_data(url)
  response = RestClient.get(url)
  book_data = JSON.parse(response)
end

def author_names(book)
  if book["volumeInfo"]["authors"] != nil
    book["volumeInfo"]["authors"].join(" and ")
  else
    "No Author Info Found"
  end
end

def title(book)
  book["volumeInfo"]["title"]
end

def description(book)
  book["volumeInfo"]["description"]
end

# display the titles, author names, and description for each book that we get back from the results

def display_books(book_data)
  book_data["items"].each.with_index(1) do |book, index|
    puts "*" * 30
    puts "#{index}. #{title(book)}"
    puts author_names(book)
    puts description(book)
  end
end

def get_user_input
  puts "Welcome to the greatest Google Books API application in the history of the world"
  puts "Enter a search term"
  query = gets.chomp.split(" ").join("+")
end
# hit the google books API and get back some results

def run
  query = get_user_input
  url = "https://www.googleapis.com/books/v1/volumes?q=#{query}"
  book_data = fetch_data(url)
  display_books(book_data)
end

run
