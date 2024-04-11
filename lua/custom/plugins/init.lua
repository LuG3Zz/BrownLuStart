-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'mg979/vim-visual-multi', event = 'BufReadPre' },
  {
    'sustech-data/wildfire.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "x", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "X", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'skywind3000/asynctasks.vim',
    dependencies = {
      'skywind3000/asyncrun.vim',
    },
    event = 'VeryLazy',
    config = function()
      vim.g.asyncrun_open = 6
      vim.g.asynctask_term_reuse = 1
      vim.keymap.set('n', '<A-b>', ':AsyncTask file-build<cr>', { desc = 'Build Task' })
      vim.keymap.set('n', '<A-r>', ':AsyncTask file-run<cr>', { desc = 'Run Current Task' })
    end,
  },
  -- MarkdownPreview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
  },
}
