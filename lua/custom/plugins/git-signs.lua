return   {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<ignore>'
        end, { expr = true, desc = 'jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<ignore>'
        end, { expr = true, desc = 'jump to previous hunk' })

        -- actions
        -- visual mode
        map('v', '<leader>gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>gr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>gs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>gs', gs.stage_buffer, { desc = 'git stage buffer' })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>gr', gs.reset_buffer, { desc = 'git reset buffer' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>gb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>gd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>gd', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- toggles
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- text object
        map({ 'o', 'x' }, 'ih', ':<c-u>gitsigns select_hunk<cr>', { desc = 'select git hunk' })
      end,
    },
  }
