require('gitsigns').setup()

local line_ok, feline = pcall(require, 'feline')
if not line_ok then
    return
end

-- "┃", "█", "", "", "", "", "", "", "●"

local icons = {
    linux = ' ',
    macos = ' ',
    windows = ' ',

    errs = ' ',
    warns = ' ',
    infos = ' ',
    hints = ' ',

    lsp = ' ',
    git = ' '
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = icons.linux
    elseif os == 'MAC' then
        icon = icons.macos
    else
        icon = icons.windows
    end
    return icon .. os
end

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

local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'purple',
    LINES = 'orange',
    BLOCK = 'white',
    REPLACE = 'yellow',
    COMMAND = 'aqua',
}

local c = {
    vim_mode = {
        provider = {
            name = 'vi_mode',
            opts = {
                show_mode_name = true,
                padding = 'center', -- Uncomment for extra padding.
            },
        },
        hl = function()
            return {
                bg = require('feline.providers.vi_mode').get_mode_color(),
                fg = 'black',
                style = 'bold',
                name = 'NeovimModeHLColor',
            }
        end,
        left_sep = 'block',
        right_sep = 'block',
    },
    gitBranch = {
        provider = 'git_branch',
        icon = icons.git,
        hl = {
            fg = 'black',
            bg = 'aqua',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    gitDiffAdded = {
        provider = 'git_diff_added',
        icon = '+',
        hl = {
            fg = 'green',
            bg = 'fg',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    gitDiffRemoved = {
        provider = 'git_diff_removed',
        icon = '-',
        hl = {
            fg = 'red',
            bg = 'fg',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    gitDiffChanged = {
        provider = 'git_diff_changed',
        icon = '~',
        hl = {
            fg = 'green',
            bg = 'fg',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    rightEdge = {
        provider = '',
        hl = function()
            return {
                fg = require('feline.providers.vi_mode').get_mode_color(),
                bg = 'bg1',
                style = 'bold',
                name = 'NeovimModeHLColorSlant',
            }
        end,
    },
    separator = {
        provider = '',
        hl = {
            bg = 'bg1',
        }
    },
    fileinfo = {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative-short',
            },
        },
        hl = {
            bg = 'bg1',
            fg = 'white',
            style = 'bold',
        },
    },
    diagnostic_errors = {
        provider = 'diagnostic_errors',
        hl = {
            fg = 'red',
            bg = 'bg1',
        },
    },
    diagnostic_warnings = {
        provider = 'diagnostic_warnings',
        hl = {
            fg = 'yellow',
            bg = 'bg1',
        },
    },
    diagnostic_hints = {
        provider = 'diagnostic_hints',
        hl = {
            fg = 'aqua',
            bg = 'bg1',
        },
    },
    diagnostic_info = {
        provider = 'diagnostic_info',
        hl = {
            bg = 'bg1',
            fg = 'fg1',
        },
    },
    file_type = {
        provider = {
            name = 'file_type',
            opts = {
                filetype_icon = true,
                case = 'titlecase',
            },
        },
        hl = {
            fg = 'black',
            bg = 'yellow',
            style = 'bold',
        },
        left_sep = {
            {
                str = '',
                hl = {
                    bg = 'bg1',
                    fg = 'yellow',
                },
            },
            {
                str = ' ',
                hl = {
                    bg = 'yellow',
                },
            },
        },
        right_sep = {
            {
                str = '',
                hl = {
                    bg = 'yellow',
                    fg = 'aqua',
                },
            },
            {
                str = ' ',
                hl = {
                    bg = 'aqua',
                },
            },
        },
    },
    file_os = {
        provider = file_osinfo,
        name = 'file_os',
        hl = {
            fg = 'black',
            bg = "red",
            style = 'bold'
        },
        left_sep = {
            {
                str = '',
                hl = {
                    bg = 'aqua',
                    fg = 'red',
                },
            },
            {
                str = ' ',
                hl = {
                    bg = 'red',
                },
            },
        },
        right_sep = 'block',
    },
    file_encoding = {
        provider = 'file_encoding',
        hl = {
            fg = 'black',
            bg = 'orange',
            style = 'italic',
        },
        left_sep = {
            {
                str = '',
                hl = {
                    bg = 'red',
                    fg = 'orange',
                },
            },
            {
                str = ' ',
                hl = {
                    bg = 'orange',
                },
            },
        },

        right_sep = 'block',
    },
    position = {
        provider = 'position',
        hl = {
            fg = 'black',
            bg = 'purple',
            style = 'bold',
        },
        left_sep = {
            {
                str = '',
                hl = {
                    bg = 'orange',
                    fg = 'purple',
                },
            },
            {
                str = ' ',
                hl = {
                    bg = 'purple',
                },
            },
        },
        right_sep = 'block',
    },
    line_percentage = {
        provider = 'line_percentage',
        hl = {
            fg = 'black',
            bg = 'green',
            style = 'bold',
        },
        left_sep = {
            {
                str = '',
                hl = {
                    bg = 'purple',
                    fg = 'green',
                },
            },
            {
                str = ' ',
                hl = {
                    bg = 'green',
                },
            },
        },
        right_sep = 'block',
    },
}

local left = {
    c.vim_mode,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    c.rightEdge,
    c.separator,
}

local middle = {
    c.fileinfo,
    c.diagnostic_errors,
    c.diagnostic_warnings,
    c.diagnostic_info,
    c.diagnostic_hints,
}

local right = {
    c.file_type,
    c.file_os,
    c.file_encoding,
    c.position,
    c.line_percentage,
}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        left,
        middle,
        right,
    },
}

feline.setup {
    components = components,
    theme = nordfox,
    vi_mode_colors = vi_mode_colors,
}
