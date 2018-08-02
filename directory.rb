def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user whart to do
    puts "1. Input the student"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name - use chop to remove any whitespace/newline
  name = gets
  name = name.chop
  puts "Enter your cohort"
  # get the cohort - use rsrip to remove any whitespace/newline
  cohort = gets
  cohort = cohort.rstrip
  if cohort.empty?
    cohort = "default"
  end
  cohort = cohort.to_sym

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    students.count == 1 ? num_of_students = "student" : num_of_students = "students"
    puts "Now we have #{students.count} #{num_of_students}"
    #get another name from the user
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Enter your cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "default"
    end
    cohort = cohort.to_sym
  end
  # return the array of students
  students
end
def print_header
  puts "The student of Villains Academy"
  puts "------------"
end
def print(students)
  cohort_list = students.each.map{|person| person[:cohort]}.uniq
  cohort_list.each do |cohort|
    puts cohort
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:cohort] == cohort
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothing happens until we call the methods
interactive_menu
