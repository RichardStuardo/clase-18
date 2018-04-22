require 'date'
class Course
	
	attr_accessor :name, :star_date, :ending_date
	def initialize(name, star_date, ending_date)
		@name = name
		@star_date = Date.parse(star_date)
		@ending_date = Date.parse(ending_date)
	end

	def self.create_course
		courses = []
		file = File.open('curso.txt', "r")
		data = file.readlines
		file.close
		data.each do |line|
			ls = line.split(', ')
			courses << Course.new(ls.shift, *ls)
		end
		courses
	end

	def self.date_before(filter_date)
		courses = create_course
		courses.each do |course|
		puts course.star_date if filter_date <= course.star_date
		end
		
	end

	def self.date_after(filter_date)
		courses = create_course
		courses.each do |course|
		puts course.ending_date if filter_date >= course.ending_date
		end
		
	end

end

  Course.create_course

   Course.date_before(Date.today)
  p Course.date_after(Date.today)