Person = {}
Person.__index = Person

function Person.new(name, age)
    local self = setmetatable({}, Person)
    self.name = name
    self.age = age
    return self
end

function Person:speak()
    print(self.name .. " says: Hello!")
end

function Person:getAge()
    return self.age
end

function Person:setAge(age)
    self.age = age
end


Student = setmetatable({}, Person)
Student.__index = Student

function Student.new(name, age, grade)
    local self = Person.new(name, age)
    setmetatable(self, Student)
    self.grade = grade
    return self
end

function Student:study()
    print(self.name .. " is studying!")
end

function Student:getGrade()
    return self.grade
end


Teacher = setmetatable({}, Person)
Teacher.__index = Teacher

function Teacher.new(name, age, subject)
    local self = Person.new(name, age)
    setmetatable(self, Teacher)
    self.subject = subject
    return self
end

function Teacher:teach()
    print(self.name .. " is teaching " .. self.subject .. "!")
end

function Teacher:getSubject()
    return self.subject
end


function displayPersonDetails(person)
    print("Name: " .. person.name)
    print("Age: " .. person.age)
    if person.grade then
        print("Grade: " .. person.grade)
    end
    if person.subject then
        print("Subject: " .. person.subject)
    end
end


function introducePeople(people)
    for _, person in ipairs(people) do
        person:speak()
        displayPersonDetails(person)
    end
end


local people = {
    Person.new("Alice", 30),
    Student.new("Bob", 20, "A"),
    Teacher.new("Dr. Smith", 45, "Mathematics"),
    Student.new("Charlie", 22, "B"),
    Teacher.new("Ms. Johnson", 39, "History")
}


introducePeople(people)


library = {}


function addBook(title, author, year)
    local book = {title = title, author = author, year = year}
    table.insert(library, book)
end


function listBooks()
    for i, book in ipairs(library) do
        print("Book " .. i .. ": " .. book.title .. " by " .. book.author .. " (" .. book.year .. ")")
    end
end


addBook("The Lua Programming Language", "Roberto Ierusalimschy", 2019)
addBook("Learning Lua", "Jesse Feiler", 2021)
addBook("Advanced Lua", "Luis Henrique", 2018)


listBooks()


counter = 0


function incrementCounter()
    counter = counter + 1
end


function resetCounter()
    counter = 0
end


print("Initial Counter: " .. counter)
incrementCounter()
incrementCounter()
print("Counter after incrementing twice: " .. counter)
resetCounter()
print("Counter after reset: " .. counter)


function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end


print("Factorial of 5: " .. factorial(5))


print("Even numbers up to 20:")
for i = 2, 20, 2 do
    print(i)
end


print("Odd numbers up to 20:")
for i = 1, 20, 2 do
    print(i)
end

Stack = {}
Stack.__index = Stack

function Stack.new()
    local self = setmetatable({}, Stack)
    self.items = {}
    return self
end

function Stack:push(item)
    table.insert(self.items, item)
end

function Stack:pop()
    return table.remove(self.items)
end

function Stack:peek()
    return self.items[#self.items]
end

function Stack:isEmpty()
    return #self.items == 0
end


local stack = Stack.new()
stack:push(10)
stack:push(20)
stack:push(30)
print("Top of the stack: " .. stack:peek())
print("Pop item: " .. stack:pop())
print("Top of the stack after pop: " .. stack:peek())


function errorExample()
    error("An example error!")
end

local success, message = pcall(errorExample)
if not success then
    print("Caught error: " .. message)
end


function countOccurrences(tbl)
    local counts = {}
    for _, item in ipairs(tbl) do
        counts[item] = (counts[item] or 0) + 1
    end
    return counts
end


local numbers = {1, 2, 3, 1, 2, 1, 4, 5, 2, 2}
local counts = countOccurrences(numbers)

for key, value in pairs(counts) do
    print(key .. ": " .. value)
end


local score = 0
for i = 1, 5 do
    print("Round " .. i)
    local random_number = math.random(1, 10)
    print("You rolled: " .. random_number)
    if random_number > 5 then
        print("You win!")
        score = score + 1
    else
        print("You lose!")
    end
end
print("Your final score is: " .. score)


local mt = {
    __add = function(a, b)
        return a.value + b.value
    end
}

local obj1 = {value = 5}
local obj2 = {value = 10}

setmetatable(obj1, mt)
setmetatable(obj2, mt)

print("Sum of obj1 and obj2: " .. (obj1 + obj2))


function createMultiplier(factor)
    return function(value)
        return value * factor
    end
end

local multiplyBy2 = createMultiplier(2)
print("Multiply 10 by 2: " .. multiplyBy2(10))

local multiplyBy3 = createMultiplier(3)
print("Multiply 10 by 3: " .. multiplyBy3(10))
