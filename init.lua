require ".luam"
require "tableutils"

local vim_env = require "modules.environment"

local test_env = vim_env.new("vim/init.lua")
test_env:render()

while true do
    local event, key = os.pullEvent()

    if event == "key" then
        test_env:handle(key)
    end
end
