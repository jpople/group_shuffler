# students.txt has each student's name on a separate line
# to make the program ignore a student, put a * before the name in students.txt (or just delete them, but that seems hard to keep track of and also impolite)

# grabs each name that's present, puts them in the students array, then shuffles students in-place
students = []
IO.foreach("./students.txt") do |name|
    if name[0] != "*" 
        students << name.chomp
    end
end
students.shuffle!

# setting up a few other things
max_room_size = 5
room_quantity = (students.length / max_room_size.to_f).ceil
rooms = []
room_quantity.times {rooms << []}

# "deals" students out into rooms
students.each.with_index do |current_student, index|
    rooms[index % room_quantity] << current_student
end

# output to file
output = File.new("./group_assignments.txt", "w")
rooms.each do |current_room|
    output.puts "Room #{rooms.index(current_room) + 1}"
    output.puts current_room
    output.puts
end