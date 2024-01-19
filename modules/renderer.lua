local theme = require "modules.theme"

local modes_text = {
    normal = "-- Normal --",
    insert = "-- Insert --",
    visual = "-- Visual --"
}

local function highlight(env)

end

local function render(env)
    assert(env, "Cannot render without an environment")

    local c_cursor = env.c_cursor
    local m_cursor = env.m_cursor
    local buffer = env.buffer

    term.clear()

    term.setTextColor(theme.default_text_color)
    term.setBackgroundColor(theme.default_background_color)

    term.setCursorPos(1, 1)

    local term_width, term_height = term.getSize()

    for i = c_cursor.y, term_height + c_cursor.y - 2 do
        local to_write_contents = buffer.contents[i]

        if not to_write_contents then
            print()
        else
            if c_cursor.x > 1 then
                to_write_contents = to_write_contents:sub(c_cursor.x)
            end
            term.write(to_write_contents)
            print()
        end
    end

    term.write(" ")
    term.write(m_cursor.y .. ":" .. m_cursor.x)
    term.write(" ")
    term.write(modes_text[env.mode])

    local highlight_color = env.mode == "normal" and theme.selected_char_color or theme.highlight_background_color

    term.setBackgroundColor(highlight_color)
    term.setTextColor(theme.highlight_text_color)
    term.setCursorPos(m_cursor.x, m_cursor.y)
    term.write(buffer.contents[m_cursor.y]:sub(m_cursor.x, m_cursor.x))

    term.setBackgroundColor(theme.default_background_color)
    term.setTextColor(theme.default_text_color)
end

return render
