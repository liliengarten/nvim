vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.cmd("syntax on")
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter",
	   build = ":TSUpdate",
	   config = function() 
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "go" },
			highlight = { enable = true },
		})
	   end
	},
	{ 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim', } },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 }
})

vim.cmd[[colorscheme tokyonight]]

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

