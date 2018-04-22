
class Table
	attr_accessor :name, :profit
	def initialize(name, *profit)
		@name = name
	    @profit = profit.map(&:to_i)
	end

	def self.create_tables
		tables = []
		file = File.open('casino.txt', "r")
		data = file.readlines
		file.close
		data.each do |line|
			ls = line.split(', ')
			tables << Table.new(ls.shift, *ls)
		end
		tables
	end

	def Table.max_profit
		tables = self.create_tables
		best_tables = {}
		tables.each_with_index do | table, day|
		best_tables[table.name] = [table.profit.max, day+1]
		end
		print best_tables.max_by{|k, v| v[0]}
	end

	def Table.profit_average
		tables = create_tables
		results = []
		tables.each do |table|
			results << table.profit
		end
		results.flatten!.inject{|sum, ele| sum + ele } / results.length
	end
end

print Table.profit_average
