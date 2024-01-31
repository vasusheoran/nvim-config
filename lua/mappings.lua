local keymap = vim.keymap
local fn = vim.fn
------ lsp ------

-- conf.extensions_list = { "themes", "terms", "fzf", "projects", "persisted", "harpoon" }

-- Format requires conform
keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { silent = true, desc = "Format" })
vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, {})
keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { silent = true, desc = "Info" })
keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { silent = true, desc = "Restart" })

------ telescope ------
keymap.set("n", "<leader>fa", "<cmd>Telescope autocommands<cr>", { silent = true, desc = "Autocommands" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true, desc = "Files" })

-- requires "olimorris/persisted.nvim"
-- keymap.set("n", "<leader>fs", "<cmd>Telescope persiste<cr>", { silent = true, desc = "Sessions" })
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { silent = true, desc = "Marks" })
keymap.set("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { silent = true, desc = "Man Pages" })
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { silent = true, desc = "Word" })

-- requires themes
-- keymap.set("n", "<leader>ft", "<cmd>Telescope themes<cr>", { silent = true, desc = "Themes" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true, desc = "Buffers" })

-- requires notify
-- keymap.set("n","<leader>fn","<cmd>lua require('telescope').extensions.notify.notify()<cr>",{ silent = true, desc = "Notify History" })

-- requires projects
-- keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { silent = true, desc = "Projects" })

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true, desc = "Help" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { silent = true, desc = "Keymaps" })
keymap.set("n", "<leader>fC", "<cmd>Telescope commands<cr>", { silent = true, desc = "Commands" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { silent = true, desc = "Recent Files" })
keymap.set("n", "<leader>fH", "<cmd>Telescope highlights<cr>", { silent = true, desc = "Highlights" })
keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { silent = true, desc = "Buffer Symbols" })
keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", { silent = true, desc = "Workspace Symbols" })
-- keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", { silent = true, desc = "Open changed file" })
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { silent = true, desc = "Checkout branch" })
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { silent = true, desc = "Checkout commit" })

------ neovim ------
keymap.set(
	"n",
	"<leader>nf",
	"<cmd>lua require('telescope.builtin').find_files({ prompt_title = 'Config Files', search_dirs = config_dir, cwd = cwd })<cr>",
	{ silent = true, desc = "Find Config Files" }
)
keymap.set(
	"n",
	"<leader>ng",
	"<cmd>lua require('telescope.builtin').live_grep({ prompt_title = 'Config Files', search_dirs = config_dir, cwd = cwd })<cr>",
	{ silent = true, desc = "Grep Config Files" }
)

-- base46 not defined 
-- keymap.set("n", "<leader>nu", "<cmd>lua ClickUpdate()<cr>", { silent = true, desc = "Config Update" })

-- NvCheatSeet not defined
-- keymap.set("n", "<leader>nc", "<cmd>NvCheatsheet<cr>", { silent = true, desc = "Cheatsheet" })
keymap.set(
	"n",
	"<leader>ni",
	"<cmd>lua if vim.fn.has('nvim-0.9.5') == 1 then vim.cmd 'Inspect' else vim.notify('Inspect isn't available in this neovim version', vim.log.levels.WARN, { title = 'Inspect' }) end<cr>",
	{ silent = true, desc = "Inspect" }
)
keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { silent = true, desc = "Messages" })
keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { silent = true, desc = "Health" })
keymap.set(
	"n",
	"<leader>nv",
	"<cmd>lua local version = vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch; return vim.notify(version, vim.log.levels.INFO, { title = 'Neovim Version' })<cr>",
	{ silent = true, desc = "Version" }
)
-- keymap.set("n", "<leader>nr", "<cmd>lua RunCode()<cr>", { silent = true, desc = "Run Code" })

---- Lazy ----
keymap.set("n", "<leader>pc", "<cmd>Lazy clean<cr>", { silent = true, desc = "Clean" })
keymap.set("n", "<leader>pC", "<cmd>Lazy check<cr>", { silent = true, desc = "Check" })
keymap.set("n", "<leader>pd", "<cmd>Lazy debug<cr>", { silent = true, desc = "Debug" })
keymap.set("n", "<leader>pi", "<cmd>Lazy install<cr>", { silent = true, desc = "Install" })
keymap.set("n", "<leader>ps", "<cmd>Lazy sync<cr>", { silent = true, desc = "Sync" })
keymap.set("n", "<leader>pl", "<cmd>Lazy log<cr>", { silent = true, desc = "Log" })
keymap.set("n", "<leader>ph", "<cmd>Lazy home<cr>", { silent = true, desc = "Home" })
keymap.set("n", "<leader>pH", "<cmd>Lazy help<cr>", { silent = true, desc = "Help" })
keymap.set("n", "<leader>pp", "<cmd>Lazy profile<cr>", { silent = true, desc = "Profile" })
keymap.set("n", "<leader>pu", "<cmd>Lazy update<cr>", { silent = true, desc = "Update" })


----- General -----
keymap.set("i", "jk", "<Esc>", { desc = "Enter normal mode" })
keymap.set({"i", "n", "v", "x"}, "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move line up and enter insert mode" })
keymap.set({"i", "n", "v", "x"}, "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "Move line down and enter insert mode" })
keymap.set("n", "<leader>R", "<cmd>%d+<cr>", { silent = true, desc = "Remove All Text" })
keymap.set("n", "<leader>y", "<cmd>%y+<cr>", { silent = true, desc = "Yank All Text" })
keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { silent = true, desc = "Quit" })
keymap.set("n", "<leader>c", "<cmd>Bdelete!<cr>", { silent = true, desc = "Close Buffer" })
keymap.set("n", "<leader>ol", function() vim.o.number = not vim.o.number end, { silent = true, desc = "Toggle Line Number" })
keymap.set("n", "<leader>or", function() vim.o.relativenumber = not vim.o.relativenumber end, { silent = true, desc = "Toggle Relative Number" })
keymap.set("n", "<leader>ot", function() require("base46").toggle_transparency() end, { silent = true, desc = "Toggle Transparency" })
keymap.set("n", "<leader>ow", function() vim.o.wrap = not vim.o.wrap end, { silent = true, desc = "Toggle Wrap" })
keymap.set({"n", "v", "x"}, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Better Down" })
keymap.set({"n", "v", "x"}, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Better Up" })
keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to upper window" })
keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to lower window" })
keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to right window" })
keymap.set("n", ";", function()
    if vim.bo.buftype == "terminal" then
        vim.cmd "Bdelete!"
        vim.cmd "silent! close"
    elseif #vim.api.nvim_list_wins() > 1 then
        vim.cmd "silent! close"
    else
        vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
    end
end, { silent = true, desc = "Close window" })

keymap.set("n", "<C-S-Up>", "<cmd>resize +2<CR>", { silent = true, desc = "Add size at the top" })
keymap.set("n", "<C-S-Down>", "<cmd>resize -2<CR>", { silent = true, desc = "Add size at the bottom" })
keymap.set("n", "<C-S-Left>", "<cmd>vertical resize +2<CR>", { silent = true, desc = "Add size at the left" })
keymap.set("n", "<C-S-Right>", "<cmd>vertical resize -2<CR>", { silent = true, desc = "Add size at the right" })

-- requires tabufline
-- keymap.set("n", "H", function() require("nvchad.tabufline").tabuflinePrev() end, { silent = true, desc = "Go to previous buffer" })
-- keymap.set("n", "L", function() require("nvchad.tabufline").tabuflineNext() end, { silent = true, desc = "Go to next buffer" })
keymap.set("n", "<", "<<", { silent = true, desc = "Indent backward" })
keymap.set("n", ">", ">>", { silent = true, desc = "Indent forward" })
keymap.set("c", "<Tab>", function()
    if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
        return "<CR>/<C-r>/"
    end
    return "<C-z>"
end, { expr = true, desc = "Word Search Increment" })

keymap.set("c", "<S-Tab>", function()
    if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
        return "<CR>?<C-r>/"
    end
    return "<S-Tab>"
end, { expr = true, desc = "Word Search Decrement" })


-- Enhanced word search in command-line mode
vim.api.nvim_set_keymap("c", "<Tab>", "<cmd>lua if fn.getcmdtype() == '/' or fn.getcmdtype() == '?' then return '<CR>/<C-r>/' else return '<C-z>' end<CR>", { expr = true, desc = "Word Search Increment" })
vim.api.nvim_set_keymap("c", "<S-Tab>", "<cmd>lua if fn.getcmdtype() == '/' or fn.getcmdtype() == '?' then return '<CR>?<C-r>/' else return '<S-Tab>' end<CR>", { expr = true, desc = "Word Search Decrement" })
