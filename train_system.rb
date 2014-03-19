require 'pg'
require './lib/line'
require './lib/station'
require './lib/stop'

DB = PG.connect(:dbname => 'train_system_test')

def main_menu
  puts "\n\n*************Welcome to the Train Menu***************"
  puts "Please select from the following options:"
  puts "ADD OPTIONS:"
  puts "1.  Add a new train line."
  puts "2.  Add a new station."
  puts "3.  Add a new stop for a train and station."
  puts "VIEW OPTIONS:"
  puts "4.  View a list of train lines."
  puts "5.  View a list of stations."
  puts "6.  View a list of stops by line."
  puts "7.  View a list of lines by station."
  puts "Press 'x' to exit."

  main_menu_choice = gets.chomp
  case main_menu_choice
  when "1"
    add_lines
  when "2"
    add_stations
  when "3"
    add_stops
  when "4"
    view_lines
  when "5"
    view_stations
  when "6"
    view_stops_by_line
  when "7"
    view_lines_by_station
  when "x"
    puts "Good-bye!"
    exit
  else
    puts "Invalid Entry.  Please try again."
    main_menu
  end
end

def add_lines
  puts "Enter the name of the new line:"
  new_line_name = gets.chomp
  new_line = Line.new({'name' => new_line_name})
  new_line.save
  puts "New line added.\n"
  main_menu
end

def add_stations
  puts "Enter the name of the new station:"
  new_station_name = gets.chomp
  new_station = Station.new({'name' => new_station_name})
  new_station.save
  puts "New station added.\n"
  main_menu
end

def add_stops
  puts "Choose a line for your new stop:\n"
  Line.all.each_with_index do |line, index|
    puts "#{index + 1}. #{line.name}"
  end
  user_choice = gets.chomp.to_i
  new_line_id = Line.all[user_choice - 1].id
  # .id = get corresponding ID that the user sees and logging it
  puts "\nLine chosen. Choose a station for your new stop:\n"
  Station.all.each_with_index do |station, index|
    puts "#{index + 1}. #{station.name}"
  end
  user_choice = gets.chomp.to_i
  new_station_id = Station.all[user_choice - 1].id

  new_stop = Stop.new({'station_id' => new_station_id, 'line_id' => new_line_id})
  new_stop.save
  puts "New stop added.\n"
  main_menu
end

def view_lines
  puts "Here is a list of all the train lines:\n"
  Line.all.each_with_index do |line,index|
    puts "#{index + 1}. #{line.name}"
  end
  puts "Press 'm' to return to the main menu or 'x' to exit."
  user_choice = gets.chomp
  if user_choice == 'x'
    exit
  else
    main_menu
  end
end

def view_stations
  puts "Here is a list of all the train stations:\n"
  Station.all.each_with_index do |station,index|
    puts "#{index + 1}. #{station.name}"
  end
  puts "Press 'm' to return to the main menu or 'x' to exit."
  user_choice = gets.chomp
  if user_choice == 'x'
    exit
  else
    main_menu
  end
end

# def view_stops_by_line
#   puts "Choose a line to view all its stops:"
#   Line.all.each_with_index do |line,index|
#     puts "#{index + 1}. #{line.name}"
#   end
# end

main_menu
