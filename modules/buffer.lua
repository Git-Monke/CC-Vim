local buffer = {
    contents = {},
    path = ""
}

function buffer.new(file_path)
    local o = {}
    setmetatable(o, buffer)

    if file_path then
        if not fs.exists(file_path) then
            error(string.format("%s not found", file_path))
        end

        if fs.isDir(file_path) then
            error(string.format("Cannot open directory as a buffer"))
        end

        local new_contents = fs.open(file_path, "r").readAll()
        o.contents = {}

        for line in new_contents:gmatch("[^\n]*\n?") do
            table.insert(o.contents, line)
        end
    end

    return o
end

function buffer:save()
    local writer = fs.open(self.path, "w")
    writer.write(self.contents)
    writer.close()
end

return buffer
