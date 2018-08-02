@students = [] # an empty array available to all methods
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students("students.csv")
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end
def show_students
  print_header
  print_students_list
  print_footer
end
def print_menu
  puts "1. Input the student"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
def create_student_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  if cohort.empty?
    cohort = "default"
  end
  cohort = cohort.to_sym

  while !name.empty? do
    create_student_array(name, cohort)
    # @students << {name: name, cohort: cohort.to_sym}
    @students.count == 1 ? num_of_students = "student" : num_of_students = "students"
    puts "Now we have #{@students.count} #{num_of_students}"
    name = STDIN.gets.chomp
    if name.empty?
      break
    end
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = "default"
    end
    cohort = cohort.to_sym
  end
end
def print_header
  puts "The student of Villains Academy"
  puts "------------"
end
def print_students_list
  cohort_list = @students.map{|person| person[:cohort]}.uniq
  cohort_list.each do |cohort|
    puts cohort
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:cohort] == cohort
    end
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # interate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    create_student_array(name, cohort)
    # @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def try_load_students
  filename = ARGV.first # first argument from the command csv_line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
