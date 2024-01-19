local function resolve_path(input)
    local wkdir = shell.dir()

    if string.sub(input, 1, 1) == "/" then
        return input
    else
        return fs.combine(wkdir, input)
    end
end

return resolve_path
