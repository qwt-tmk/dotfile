return {
 'nvim-telescope/telescope.nvim',
 tag = '0.1.8',
 dependencies = {
   'nvim-lua/plenary.nvim',
   'nvim-telescope/telescope-file-browser.nvim',
   'nvim-telescope/telescope-fzf-native.nvim',
   'smartpde/telescope-recent-files',
 },
 keys = {
   {
     "<leader>ff",
     function()
       require('telescope.builtin').find_files({
         initial_mode = "insert",
       })
     end,
     desc = 'Find Plugin File',
   },
   {
     "<leader>fd",
     function()
       local telescope = require("telescope")
       local function telescope_buffer_dir()
         return vim.fn.expand("%:p:h")
       end

      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
      end,
      desc = "Open File Browser with the path of the current buffer",
   },
   {
     "<leader>fr",
     function()
       require('telescope.builtin').live_grep({
         additional_args = { "--hidden" },
       })
     end,
     desc = "serch for a string in your current working directory and get result live as you type",
   },
   {
     "<leader>fh",
     function()
       require('telescope.builtin').help_tags({})
     end
   },
   {
     "<leader>fb",
     function()
       require('telescope.builtin').buffers({})
     end
   },
   {
     "<leader>fo",
     function()
       require('telescope').extensions.recent_files.pick({
        initial_mode = "normal",
       })
     end
   }
 },
 config = function(_, opts)
   local telescope = require("telescope")
   opts.extensions = {
     file_browser = {
       hijack_netrw = true,
       mappings = {
         n = {
           ["-"] = require("telescope").extensions.file_browser.actions.goto_parent_dir
         }
       },
     },
     recent_files = {
       ignore_patterns = {"/tmp/","/opt/homebrew/"}
     },
   }
   opts.defaults = {
     sorting_strategy = "descending",
     mappings = {
       i = {
         ["<C-u>"] = false
       },
     },
   }
   telescope.setup(opts)
   telescope.load_extension("file_browser")
   telescope.load_extension("recent_files")
 end
}
