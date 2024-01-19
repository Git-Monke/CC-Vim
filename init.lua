local args = { ... }
local resolve_path = require "modules.resolve_path"

assert(args[1], "A file path is required")

local path = resolve_path(args[1])

assert(fs.exists(path, "The provided file path does not exist"))
assert(not fs.isDir(path), "Cannot open a directory")

local vim_env = require "modules.environment"

local env = vim_env.new(path)
env:render()

while true do
    local event, key = os.pullEventRaw()

    if event == "key" then
        env:handle(key)
    end

    if event == "terminate" then
        term.clear()
        term.setCursorPos(1, 1)
        break
    end
end
