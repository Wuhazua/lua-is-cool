local coroutine = require("coroutine")

-- Task scheduler with coroutines
local function scheduler()
    local tasks = {}
    local function add_task(task)
        table.insert(tasks, task)
    end
    local function run()
        for _, task in ipairs(tasks) do
            coroutine.resume(task)
        end
    end
    return add_task, run
end

-- Create scheduler
local add_task, run = scheduler()

-- Define tasks
add_task(coroutine.create(function()
    for i = 1, 5 do
        print("Task 1: ", i)
        coroutine.yield()
    end
end))

add_task(coroutine.create(function()
    for i = 1, 3 do
        print("Task 2: ", i)
        coroutine.yield()
    end
end))

-- Run the tasks
run()
