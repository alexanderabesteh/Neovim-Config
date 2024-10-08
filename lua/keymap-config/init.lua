local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> Oil <--
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--> Neogit <--
map("n", "ng", ":Neogit<CR>", {})

--> Diffview <--
map("n", "<leader>do", ":DiffviewOpen<CR>", {})
map("n", "<leader>dc", ":DiffviewClose<CR>", {})
map("n", "<leader>dt", ":DiffviewToggleFiles<CR>", {})

--> Telescope mappings <--
map("n", "<leader>fd", ":Telescope diagnostics<cr>", opts)
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fr", ":Telescope lsp_references<cr>", opts)
map("n", "<leader>oc", ":Telescope lsp_outgoing_calls<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)

--> Tree <--
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ge", ":NvimTreeFocus<CR>", opts)

--> General <--
map("n", "<leader>r", ":luafile %<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<cR>", opts)

--> Leap <--
map("n", "s", "<Plug>(leap-forward)", opts)
map("n", "S", "<Plug>(leap-backward)", opts)
map("n", "gs", "<Plug>(leap-from-window)", opts)

--> Compilers <--
local lang_maps = {
    cpp = { build = "g++ % -o %:r", exec = "%:r" },
    typescript = { exec = "bun %" },
    javascript = { exec = "bun %" },
    python = { exec = "python %" },
    --python = { exec = "poetry run python %" },
    --java = { build = "javac %", exec = "java %:r" },
    java = { exec = "java %" },
    sh = { exec = "./%" },
    go = { build = "go build", exec = "go run %" },
    rust = { exec = "cargo run" },
    arduino = {
        build = "arduino-cli compile --fqbn arduino:avr:uno %:r",
        exec = "arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:r",
    },
}

--> Execute Compilers <--
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
