local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> oil <--
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--> neogit <--
map("n", "ng", ":Neogit<CR>", {})
--> diffview <--
map("n", "<leader>do", ":DiffviewOpen<CR>", {})
map("n", "<leader>dc", ":DiffviewClose<CR>", {})
map("n", "<leader>dt", ":DiffviewToggleFiles<CR>", {})
--> telescope mappings <--
map("n", "<leader>fd", ":Telescope diagnostics<cr>", opts)
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fr", ":Telescope lsp_references<cr>", opts)
map("n", "<leader>oc", ":Telescope lsp_outgoing_calls<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
--> tree <--
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ge", ":NvimTreeFocus<CR>", opts)
--> general <--
map("n", "<leader>r", ":luafile %<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
--> leap <--
map("n", "s", "<Plug>(leap-forward)", opts)
map("n", "S", "<Plug>(leap-backward)", opts)
map("n", "gs", "<Plug>(leap-from-window)", opts)

local lang_maps = {
    cpp = { build = "g++ % -o %:r", exec = "%:r" },
    typescript = { exec = "bun %" },
    javascript = { exec = "bun %" },
    python = { exec = "python %" },
    java = { build = "javac %", exec = "java %:r" },
    sh = { exec = "./%" },
    go = { build = "go build", exec = "go run %" },
    rust = { exec = "cargo run" },
    arduino = {
        build = "arduino-cli compile --fqbn arduino:avr:uno %:r",
        exec = "arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:r",
    },
}

for lang, data in pairs(lang_maps) do
    if data.build ~= nil then
        vim.api.nvim_create_autocmd(
            "FileType",
            { command = "nnoremap <Leader>b :!" .. data.build .. "<CR>", pattern = lang }
        )
    end

    vim.api.nvim_create_autocmd(
        "FileType",
        { command = "nnoremap <Leader>z :split<CR>:terminal " .. data.exec .. "<CR>", pattern = lang }
    )
end
