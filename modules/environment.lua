local cursor = require "modules.cursor"
local buffer = require "modules.buffer"
local render = require "modules.renderer"
local mouse_cursor = require "modules.mouse_cursor"

local keybinds = require "modules.keybinds"

local environment = {
    m_cursor = nil,
    c_cursor = nil,
    buffer = nil,
    mode = "normal"
}

function environment.new(file_path)
    assert(file_path, "Cannot create an environment without a file path")

    local env = {}
    setmetatable(env, { __index = environment })

    local env_buffer = buffer.new(file_path)

    -- Mouse cursor
    local m_cursor = mouse_cursor.new()

    -- Camera cursor
    local c_cursor = cursor.new()

    env.buffer = env_buffer
    env.m_cursor = m_cursor
    env.c_cursor = c_cursor

    return env
end

function environment:move_cursor_x(count)
    local mouse = self.m_cursor
    local buffer = self.buffer

    if count < 0 then
        if mouse.x + count >= 1 then
            mouse:move_x(count)
        end
    elseif mouse.x + count <= #buffer.contents[mouse.y] then
        mouse:move_x(count)
    end
end

function environment:move_cursor_y(count)
    local mouse = self.m_cursor
    local buffer = self.buffer

    if count < 0 then
        if mouse.y + count >= 1 then
            mouse:move_y(count, buffer)
        end
    elseif mouse.y + count <= #buffer.contents then
        mouse:move_y(count, buffer)
    end
end

function environment:handle(key)
    if key == keybinds.down then
        self:move_cursor_y(1)
    end

    if key == keybinds.up then
        self:move_cursor_y(-1)
    end

    if key == keybinds.right then
        self:move_cursor_x(1)
    end

    if key == keybinds.left then
        self:move_cursor_x(-1)
    end

    if key == keybinds.insert_mode then
        self.mode = "insert"
    end

    if key == keybinds.normal_mode then
        self.mode = "normal"
    end

    if key == keybinds.visual_mode then
        self.mode = "visual"
    end

    self:render()
end

function environment:render()
    render(self)
end

return environment
