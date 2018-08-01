def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Enter your cohort"
  cohort = gets.chomp
  if cohort.empty?
    cohort = "default"
  end
  cohort = cohort.to_sym
  puts "Enter favorite hobby"
  hobby = gets.chomp
  puts "Enter country of birth"
  country_of_birth = gets.chomp
  puts "Enter height"
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby, country: country_of_birth, height: height}
    puts "Now we have #{students.count} students"
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
    puts "Enter favorite hobby"
    hobby = gets.chomp
    puts "Enter country of birth"
    country_of_birth = gets.chomp
    puts "Enter height"
    height = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "The student of Villains Academy"
  puts "------------"
end
def print(students)
  count = 0
  while count < students.length
    puts "#{count+1}. #{students[count][:name]} #{students[count][:hobby]} #{students[count][:country]} #{students[count][:height]} #{students[count][:cohort]}".center(100)
    count += 1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
