-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "tyrannicaltoucan/vim-quantum",
      lazy=false,
      priority=1000,
      config = function()
          vim.g.quantum_black = 1
          vim.g.quantum_italics = 1
          vim.cmd("colorscheme quantum") 
      end,
    },

    {"itchyny/lightline.vim"},
    {"ryanoasis/vim-devicons"},
    {"sheerun/vim-polyglot"},
    {"skywind3000/vim-terminal-help"},
    {"tpope/vim-fugitive"},
    {"tpope/vim-commentary"},
    {"tpope/vim-rhubarb"},
    {"tpope/vim-surround"},
    {"sbdchd/vim-run"},
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {"mfussenegger/nvim-dap"},
    {"mfussenegger/nvim-dap-python"},
    {"BurntSushi/ripgrep"},
    {"williamboman/mason.nvim", lazy=false},
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason-lspconfig.nvim"},
    {"sharkdp/fd"},
    {"nvim-treesitter/nvim-treesitter", build=":TSUpdate"},
    {
      "nvim-telescope/telescope.nvim",
      branch="0.1.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
      {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
          -- add any options here
        },
        dependencies = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          -- OPTIONAL:
          --   `nvim-notify` is only needed, if you want to use the notification view.
          --   If not available, we use `mini` as the fallback
          "rcarriga/nvim-notify",
          }
      }
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- require("mason").setup()
-- lua require("mason-lspconfig").setup()
-- lua require("lspconfig").pylsp.setup{
-- 	settings = {
-- 		pylsp = {
-- 			pylsp = {
-- 				pycodestyle = { 
-- 					maxLineLength = 120
-- 				}
-- 			}
-- 		}
-- 	}
-- }

vim.g.lightline = {
	colorscheme = "quantum",
	active = {
		left = {{"mode", "paste"}, {"gitbranch", "readonly", "filename", "modified"}}
	},
	component_function = { gitbranch="FugitiveHead" },
}

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g.terminal_cwd=2 -- Project root
vim.g.terminal_close=1

vim.keymap.set("n", "<F5>", ":Run <Enter>", {})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap=true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.opt.showmode = false

vim.opt.laststatus=2
vim.opt.clipboard="unnamedplus"
