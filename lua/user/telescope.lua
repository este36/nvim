local M = {
  "nvim-telescope/telescope.nvim",
dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
}

function M.config()

  KEYMAP("n", "<leader>bb", "<CMD> Telescope buffers previewer=false <CR>", OPTS)
  KEYMAP("n", "<leader>fb", "<CMD> Telescope git_branches <CR>", OPTS)
  KEYMAP("n", "<leader>fc", "<CMD> Telescope colorscheme <CR>", OPTS)
  KEYMAP("n", "<leader>ff", "<CMD> Telescope find_files <CR>", OPTS)
  KEYMAP("n", "<leader>fp", "<CMD> lua require('telescope').extensions.projects.projects() <CR>", OPTS)
  KEYMAP("n", "<leader>ft", "<CMD> Telescope live_grep <CR>", OPTS)
  KEYMAP("n", "<leader>fh", "<CMD> Telescope help_tags <CR>", OPTS)
  KEYMAP("n", "<leader>fl", "<CMD> Telescope resume <CR>", OPTS)
  KEYMAP("n", "<leader>fr", "<CMD> Telescope oldfiles <CR>", OPTS)
  
  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "truncate" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "respect_case", -- "smart_case", "ignore_case" or "respect_case"
      },
    },
  }
end

return M
