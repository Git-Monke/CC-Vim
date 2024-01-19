local m_cursor = {
    cached_x = 1,
    x = 1,
    y = 1
}

function m_cursor.new()
    local o = {}
    setmetatable(o, { __index = m_cursor })
    return o
end

function m_cursor:move_x(count)
    self.x = self.x + count
    self.cached_x = self.x
end

function m_cursor:move_y(count, env_buffer)
    self.y = self.y + count
    local line_length = #env_buffer.contents[self.y] or 1
    self.x = self.cached_x <= line_length and self.cached_x or line_length
end

return m_cursor
