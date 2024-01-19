local cursor = {
    x = 1,
    y = 1
}

function cursor.new()
    local o = {}
    setmetatable(o, { __index = cursor })
    return o
end

function cursor:move_x(amount)
    self.x = self.x + amount
end

function cursor:move_y(amount)
    self.y = self.y + amount
end

return cursor
