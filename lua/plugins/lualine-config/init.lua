local lualine = require('lualine')

-- Copy Paste Separators
-- "┃", "█", "", "", "", "", "", "", "●"

--> nordfoxcheme
local nordfox = {
    fg = "#4c566a",
    bg = "#434c5e",
    fg1 = "#cdcecf",
    bg1 = "#2e3440",
    yellow = "#ebcb8b",
    green = "#a3be8c",
    orange = "#d08770",
    red = "#bf616a",
    purple = "#b48ead",
    darkblue = "#5e81ac",
    aqua = "#88c0d0",
    peanut = "#f6d5a4",
    white = "#eceff4",
    black = "#000000",
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = { left = '', right = '' },
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = nordfox.black, bg = nordfox.bg1 } },
            inactive = { c = { fg = nordfox.fg, bg = nordfox.bg1 } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    -- mode component
    'mode',
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = nordfox.yellow,
            i = nordfox.red,
            v = nordfox.green,
            ['␖'] = nordfox.aqua,
            V = nordfox.aqua,
            c = nordfox.aqua,
            no = nordfox.red,
            s = nordfox.orange,
            S = nordfox.orange,
            ['␓'] = nordfox.orange,
            ic = nordfox.yellow,
            R = nordfox.purple,
            Rv = nordfox.purple,
            cv = nordfox.darkblue,
            ce = nordfox.darkblue,
            r = nordfox.darkblue,
            rm = nordfox.darkblue,
            ['r?'] = nordfox.darkblue,
            ['!'] = nordfox.red,
            t = nordfox.red,
        }
        return { bg = mode_color[vim.fn.mode()] }
    end,
}

ins_left {
    function()
        return ''
    end,
    padding = { left = 0, right = 0 },
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = nordfox.yellow,
            i = nordfox.red,
            v = nordfox.green,
            ['␖'] = nordfox.aqua,
            V = nordfox.aqua,
            c = nordfox.aqua,
            no = nordfox.red,
            s = nordfox.orange,
            S = nordfox.orange,
            ['␓'] = nordfox.orange,
            ic = nordfox.yellow,
            R = nordfox.purple,
            Rv = nordfox.purple,
            cv = nordfox.darkblue,
            ce = nordfox.darkblue,
            r = nordfox.darkblue,
            rm = nordfox.darkblue,
            ['r?'] = nordfox.darkblue,
            ['!'] = nordfox.red,
            t = nordfox.red,
        }
        return { fg = mode_color[vim.fn.mode()], bg = nordfox.purple }
    end,
}

ins_left {
    'branch',
    icon = ' ',
    --icon = '',
    color = { bg = nordfox.purple, fg = nordfox.black, gui = 'bold' },
}

ins_left {
    function()
        return ''
    end,
    color = { bg = nordfox.bg1, fg = nordfox.purple }, -- Sets highlighting of component
    padding = { left = 0, right = 0 },
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = nordfox.white, gui = 'bold' },
}

ins_left {
    'diff',
    color = { fg = nordfox.aqua },
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
        added = { fg = nordfox.green },
        modified = { fg = nordfox.orange },
        removed = { fg = nordfox.red },
    },
    cond = conditions.hide_in_width,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { bg = nordfox.bg1, fg = nordfox.white, gui = 'bold' },
}

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        error = { fg = nordfox.red },
        warn = { fg = nordfox.yellow },
        info = { fg = nordfox.aqua },
    },
}

ins_right {
    function()
        return ''
    end,
    color = { bg = nordfox.bg1, fg = nordfox.aqua },
    padding = { left = 0, right = 0 },
}

ins_right {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
    color = { bg = nordfox.aqua, fg = nordfox.black }
}

ins_right {
    function()
        return ''
    end,
    color = { bg = nordfox.aqua, fg = nordfox.red },
    padding = { left = 0, right = 0 },
}

-- Add components to right sections
ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { bg = nordfox.red, fg = nordfox.black, gui = 'bold' },
}

ins_right {
    function()
        return ''
    end,
    color = { bg = nordfox.red, fg = nordfox.orange },
    padding = { left = 0, right = 0 },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false,
    color = { bg = nordfox.orange, fg = nordfox.black, gui = 'bold' },
}

ins_right {
    function()
        return ''
    end,
    color = { bg = nordfox.orange, fg = nordfox.purple },
    padding = { left = 0, right = 0 },
}

ins_right { 'location', color = { bg = nordfox.purple, fg = nordfox.black } }

ins_right {
    function()
        return ''
    end,
    color = { bg = nordfox.purple, fg = nordfox.green },
    padding = { left = 0, right = 0 },
}

ins_right { 'progress', color = { bg = nordfox.green, fg = nordfox.black, gui = 'bold' } }

-- Now don't forget to initialize lualine
lualine.setup(config)
