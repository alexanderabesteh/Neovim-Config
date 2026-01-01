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

--> LSP Navigation <--
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

--> Telescope mappings <--
map("n", "<leader>fd", ":Telescope diagnostics<cr>", opts)
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fr", ":Telescope lsp_references<cr>", opts)
map("n", "<leader>oc", ":Telescope lsp_outgoing_calls<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
map(
	"n",
	"<C-f>",
	":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending'})<CR>",
	opts
)

--> Tree <--
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ge", ":NvimTreeFocus<CR>", opts)

--> General <--
map("n", "<leader>r", ":luafile %<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<cR>", opts)

--> Floatterm <--
map("n", "<leader>t", ":FloatermToggle<CR>", opts)
map("t", "<leader>t", "<C-\\><C-n>:FloatermToggle<CR>", opts)
map("t", "<esc>", "<C-\\><C-n>:FloatermToggle<CR>", opts)

--> Tagbar <--
map("n", "<leader>p", ":TagbarToggle<CR>", opts)

--> Dianostic <--
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

--> Copilot <--
map("n", "<leader>xc", ":CopilotChat<CR>", opts)
map("v", "<leader>xe", ":CopilotChatExplain<CR>", opts)
map("v", "<leader>xr", ":CopilotChatReview<CR>", opts)
map("v", "<leader>xf", ":CopilotChatFix<CR>", opts)
map("v", "<leader>xo", ":CopilotChatOptimize<CR>", opts)
map("v", "<leader>xd", ":CopilotChatDocs<CR>", opts)
map("v", "<leader>xt", ":CopilotChatTests<CR>", opts)
map("n", "<leader>xm", ":CopilotChatCommit<CR>", opts)

--> Window Navigation <--
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

--> Bufferline <--
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)
