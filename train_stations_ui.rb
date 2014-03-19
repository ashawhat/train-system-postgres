require 'pg'
require './lib/train'
require './lib/station'

DB = PG.connect({:dbname => 'train_map'})

def title
  puts "Welcome to Your City's Interactive Train Map"
  main_menu
end

def main_menu
  puts "Press 'o' if you are a train operator"
  puts "Press 'r' if you are a train rider"
  puts "Press 'x' to Exit the System"
  main_input = gets.chomp.to_s
  case main_input
  when "o"
    operator_menu
  when "r"
    rider_menu
  when "x"
    exit
  else
    main_menu
  end
end

def operator_menu
  puts "Press 's' to add a train station"
  puts "Press 'l' to add a train line"
  puts "Press v to view stored information"
  main_operator_input = gets.chomp.to_s
  case main_operator_input
  when 's'
    add_train_station
  when 'l'
    add_train_line
  when 'v'
    select_view
  else
    main_menu
  end
end

def add_train_station
  puts "Enter the Name of the Train Station:"
  new_station = gets.chomp
  new_station = Station.new(new_station)
  new_station.save
  puts 'The Station- ' +  Station.all[-1].name + ' has been added to the Directory of Stations'
  puts "\n\n"
  puts "To View All Stations, Select 'v'"
  selection = gets.chomp
  case selection
  when 'v'
    view_stations
  else
    main_menu
  end
  main_menu
end

def add_train_line
  puts "Enter the Train Line:"
  new_line = gets.chomp
  new_line = Train.new(new_line)
  new_line.save
  puts 'You have added the ' + Train.all[-1].name + ' to the Directory of Train Lines'
  puts "\n\n"
  puts "To View All Train Lines, Select 'v'"
  selection = gets.chomp
  case selection
  when 'v'
    view_lines
  else
  main_menu
end
main_menu
end

def select_view
  puts "View Stations or Lines?"
  puts "Select 's' for Stations or 'l' for Lines"
  selection = gets.chomp
  case selection
  when 's'
    view_stations
  when 'l'
    view_lines
  else
    select_view
  end
end

def view_stations
  Station.all.each do |station|
    print "#{station.name}\n\n"
  end
  main_menu
end

def view_lines
  Train.all.each do |train|
    print "#{train.name}\n\n"
  end
  main_menu
end



title

