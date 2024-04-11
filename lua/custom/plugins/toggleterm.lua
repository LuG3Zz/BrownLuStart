return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
    },
    config = function()
      local status, toggleterm = pcall(require, 'toggleterm')
      if not status then
        vim.notify 'not found toggleterm'
        return
      end

      toggleterm.setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          elseif term.direction == 'float' then
            return 50
          end
        end,
        autochdir = true,
      }
      local opt = { noremap = true, silent = true }

      local function map(mode, lhs, rhs)
        vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
      end

      local Terminal = require('toggleterm.terminal').Terminal

      function _lazygit_toggle()
        local lazygit = Terminal:new {
          cmd = 'lazygit',
          hidden = true,
          direction = 'float',
          dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h'),
          float_opts = {
            border = 'double',
          },
          on_open = function(term)
            vim.cmd 'startinsert!'
            vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
          end,
          on_close = function(term)
            vim.cmd 'startinsert!'
          end,
        }
        lazygit:toggle()
      end

      -- Terminal related
      map('n', '<leader>t', '<CMD>ToggleTerm direction=horizontal<CR>')
      map('n', '<leader>tf', '<CMD>ToggleTerm direction=float<CR>')
      -- tool.map("t", "<leader>t", "<CMD>ToggleTerm direction=horizontal<CR>")
      map('n', '<leader>vt', '<CMD>ToggleTerm direction=vertical<CR>')
      -- tool.map("t", "<leader>vt", "<CMD>ToggleTerm direction=vertical<CR>")
      map('n', '<leader>tg', '<cmd>lua _lazygit_toggle()<cr>')
    end,
  },
}
