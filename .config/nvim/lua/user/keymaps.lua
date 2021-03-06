local opts = {noremap = true, silent = true}

local kmap = vim.keymap.set

kmap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Misc
kmap("n", "<leader>ww", ":w<cr>", opts)
kmap("n", "<leader>wq", ":wq<cr>", opts)
kmap("n", "<leader>q", ":Bdelete<cr>", opts)
kmap("n", "<leader>fq", ":Bdelete!<cr>", opts)

-- Clear search highlights
kmap("n", "<A-a>", ":nohl<cr>", opts)

-- Insert line above/below without leaving normal mode
kmap("n", "<a-o>", "moO<esc>`o", opts)
kmap("n", "<a-i>", "moo<esc>`o", opts)

-- Switch Buffers
kmap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
kmap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Better window navigation
kmap("n", "<C-h>", "<C-w>h", opts)
kmap("n", "<C-j>", "<C-w>j", opts)
kmap("n", "<C-k>", "<C-w>k", opts)
kmap("n", "<C-l>", "<C-w>l", opts)
kmap("n", "<C-q>", "<C-w>q", opts)

-- Resize windows with arrow keys
kmap("n", "<A-Up>", ":resize +5<cr>", opts)
kmap("n", "<A-Down>", ":resize -5<cr>", opts)
kmap("n", "<A-Left>", ":vertical resize +5<cr>", opts)
kmap("n", "<A-Right>", ":vertical resize -5<cr>", opts)

-- Open/Close windows
kmap("n", "<leader>v", "<C-w>v", opts)
kmap("n", "<leader>o", "<C-w>o", opts)
kmap("n", "<leader>s", "<C-w>s", opts)

-- Insert Mode
kmap("i", "<A-h>", "<left>", opts)
kmap("i", "<A-j>", "<down>", opts)
kmap("i", "<A-k>", "<up>", opts)
kmap("i", "<A-l>", "<right>", opts)

-- kmap("i", ":w", "<ESC>:w<cr>", opts)

-- Delete backwards
kmap("i", "<A-d>", "<DELETE>", opts)
kmap("i", "<C-d>", "<C-o>dw", opts)

-- Paste in insert mode
kmap("i", "<C-p>", "<left><C-o>p", opts)

-- Leave insert mode
kmap("i", "jj", "<ESC>", opts)

-- Indent Jump
kmap("", "[q", "<Plug>(IndentWisePreviousLesserIndent)", {silent=true})
kmap("", "[w", "<Plug>(IndentWisePreviousEqualIndent)", {silent=true})
kmap("", "[e", "<Plug>(IndentWisePreviousGreaterIndent)", {silent=true})

kmap("", "]q", "<Plug>(IndentWiseNextLesserIndent)", {silent=true})
kmap("", "]w", "<Plug>(IndentWiseNextEqualIndent)", {silent=true})
kmap("", "]e", "<Plug>(IndentWiseNextGreaterIndent)", {silent=true})

kmap("", "[_", "<Plug>(IndentWisePreviousAbsoluteIndent)", {silent=true})
kmap("", "]_", "<Plug>(IndentWiseNextAbsoluteIndent)", {silent=true})

kmap("", "[%", "<Plug>(IndentWiseBlockScopeBoundaryBegin)", {silent=true})
kmap("", "]%", "<Plug>(IndentWiseBlockScopeBoundaryEnd)", {silent=true})

-- Visual
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Move selection up/down
kmap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
kmap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- paste without copying selection
kmap("v", "p", '"_dP', opts)

-- Nvim tree
kmap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
kmap("n", "<leader>pp", "<cmd>Telescope find_files<cr>", opts)
kmap("n", "<leader>ph", "<cmd>Telescope find_files<cr>", opts)
kmap("n", "<leader>pg", "<cmd>Telescope live_grep<cr>", opts)
kmap("n", "<leader>pb", "<cmd>Telescope buffers<cr>", opts)
kmap("n", "<leader>po", "<cmd>Telescope project project<cr>", opts)

-- Git
kmap("n", "<leader>gs", ":G<cr>", opts)
kmap("n", "<leader>gf", ":diffget //2<cr>", opts)
kmap("n", "<leader>gj", ":diffget //3<cr>", opts)

-- Undo tree
kmap("n", "<leader>u", ":UndotreeShow<cr>", opts)

-- Toggle Term
kmap({"n", "t"}, "<C-t>p", "<cmd>lua _PYTHON_TOGGLE()<cr>" , opts)

-- Copilot
kmap("i", "<C-a>", "copilot#Accept(\"\\<CR>\")", {noremap=false, silent=true, script=true, expr=true})
kmap("i", "<C-q><C-q>", "<C-o>:Copilot disable<cr>", opts)
kmap("i", "<C-q><C-e>", "<C-o>:Copilot enable<cr>", opts)
vim.g.copilot_no_tab_map = true

-- Dial
kmap({"n", "v"}, "<C-a>", require("dial.map").inc_normal(), {noremap = true})
kmap({"n", "v"}, "<C-x>", require("dial.map").dec_normal(), {noremap = true})
kmap("v", "g<C-a>", require("dial.map").inc_gvisual(), {noremap = true})
kmap("v", "g<C-x>", require("dial.map").dec_gvisual(), {noremap = false})

-- Debugging
kmap("n", "<leader>db", require("dap").toggle_breakpoint, opts)
kmap("n", "<F9>",       require("dap").toggle_breakpoint, opts)
kmap("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition: ")) end, opts)
kmap("n", "<leader>dc", require("dap").continue, opts)
kmap("n", "<F5>",       require("dap").continue, opts)
kmap("n", "<leader>do", require("dap").step_over, opts)
kmap("n", "<F6>",       require("dap").step_over, opts)
kmap("n", "<leader>di", require("dap").step_into, opts)
kmap("n", "<F7>",       require("dap").step_into, opts)
kmap("n", "<leader>dO", require("dap").step_out, opts)
kmap("n", "<F19>",     require("dap").step_out, opts)
kmap("n", "<leader>dr", require("dap").repl.toggle, opts)
kmap("n", "<leader>dl", require("dap").run_last, opts)
kmap("n", "<leader>du", require("dapui").toggle, opts)
kmap("n", "<leader>dt", require("dap").terminate, opts)
kmap("n", "<F8>",       require("dap").terminate, opts)
kmap("n", "<leader>de", require("dapui").eval, opts)
