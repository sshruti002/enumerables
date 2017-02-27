#You learned about the Enumerable module that gets mixed in to the Array and Hash classes (among others) and provides you with lots of handy it#erator methods. To prove that there's no magic to it, you're going to rebuild those methods.

module Enumerable

def my_each
	for i in self
	yield i
	end
end #end of my_each


def my_each_with_index
	for i in (0...self.length)
	yield "#{self[i]} : #{i}"        #self[i] is the element followed by i which is the index
	end
	self
end #end of my_each_with_index

def my_select
	result = []
	self.my_each do |i|
		result << i if yield(i)
		end

	puts result.inspect
end #end of my_select


def my_all?
	result = []
	self.my_each do |i|
	result.push(yield(i))
	end
	if result.include? false
	puts false
	else puts true
	end
end  #end of my_all?


def my_any?
	result = []
	self.my_each do |i|
	result.push(yield(i))
	end
	if result.include? true
	puts true
	else puts false
	end
end  #end of my_any?


def my_none?
	result = []
	self.my_each do |i|
	result.push(yield(i))
	end
	if result.include? true
	puts false
	else puts true
	end
end


def my_count
	result = []
	count = 0
	self.my_each do |i|
	if yield(i)
	count += 1
	end
	end
	puts count
end


def my_map
	result=[]
	for i in self
	result.push(yield(i))
	end
	puts result.inspect

	
	
end


def my_inject(*args)
result=args[0]
self.my_each do |i| 
result = yield(result, i)
end
puts result


end



end #end of module

[1,2,3,4].my_inject(1) do |total,num|
 total += num
end






