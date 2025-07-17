-- ~/.config/nvim/lua/plugins/fun.lua
return {
  -- Typing speed test
  {
    "NStefan002/speedtyper.nvim",
    cmd = "Speedtyper",
    config = function()
      require("speedtyper").setup({
        window = {
          height = 0.5, -- percent of the editor height
          width = 0.8, -- percent of the editor width
        },
        language = "en", -- available languages: "en", "es", "de", "fr", "it", "pt", "ru", "zh"
        game_modes = { "words", "time" }, -- available modes: "words", "time"
        -- You can customize word lists and more here
      })
      -- Changed keymap to avoid conflict with terminal
      vim.keymap.set("n", "<leader>fst", "<cmd>Speedtyper<CR>", { desc = "Speed typer test" })
    end,
  },
  -- Vim movement practice game
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  -- Duck that walks across your screen
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set("n", "<leader>fd", function()
        -- Only spawn duck in normal modifiable buffers
        if vim.bo.modifiable and vim.bo.buftype == "" then
          require("duck").hatch()
        else
          vim.notify("Switch to a normal buffer to spawn duck!", vim.log.levels.WARN)
        end
      end, { desc = "Duck hatch" })
      vim.keymap.set("n", "<leader>fk", function()
        require("duck").cook()
      end, { desc = "Duck cook (kill)" })
    end,
    cmd = { "DuckHatch", "DuckCook" },
  },
  -- Display images as ASCII art
  {
    "princejoogie/chafa.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("chafa").setup({
        render = {
          min_padding = 5,
          show_label = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
      -- Add this keymap for quick access
      vim.keymap.set("n", "<leader>fi", "<cmd>ViewImage<CR>", { desc = "View image as ASCII" })
    end,
    cmd = { "ViewImage" },
  },
  -- Make your code fall apart with visual effects
  {
    "eandrju/cellular-automaton.nvim",
    config = function()
      vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
      vim.keymap.set("n", "<leader>fgl", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Game of life" })
    end,
    cmd = { "CellularAutomaton" },
  },
  -- Floating terminal for quick commands
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
      -- Keep your existing <leader>ft mapping
      vim.keymap.set("n", "<leader>ft", "<cmd>ToggleTerm<CR>", { desc = "Toggle floating terminal 💻" })
      -- Additional terminal mappings
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal left" })
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal down" })
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal up" })
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal right" })
    end,
  },
  -- Rainbow parentheses
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = function()
            if not vim.b.rainbow_enabled then
              return nil
            end
            return require("rainbow-delimiters").strategy["global"]
          end,
        },
        query = {
          [""] = "rainbow-delimiters",
          latex = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
      vim.keymap.set("n", "<leader>fr", function()
        vim.b.rainbow_enabled = not vim.b.rainbow_enabled
        vim.cmd("edit") -- Refresh buffer
        local status = vim.b.rainbow_enabled and "enabled" or "disabled"
        vim.notify("Rainbow delimiters " .. status .. " 🌈", vim.log.levels.INFO)
      end, { desc = "Toggle rainbow delimiters 🌈" })
    end,
  },
  -- Pomodoro timer
  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession", "TimerStop" },
    config = function()
      require("pomo").setup({
        sessions = {
          pomodoro = {
            { name = "Work", duration = "25m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "25m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "25m" },
            { name = "Long Break", duration = "15m" },
          },
        },
        notifiers = {
          {
            name = "Default",
            opts = {
              sticky = false,
              title_icon = "⏱️",
              text_icon = "🍅",
            },
          },
        },
      })
      -- Pomodoro keymaps
      vim.keymap.set("n", "<leader>fp", "<cmd>TimerStart 25m Work<CR>", { desc = "Start Pomodoro 🍅" })
      vim.keymap.set("n", "<leader>fP", "<cmd>TimerSession pomodoro<CR>", { desc = "Pomodoro session 🍅" })
      vim.keymap.set("n", "<leader>fb", "<cmd>TimerStart 5m Break<CR>", { desc = "Start break ☕" })
      vim.keymap.set("n", "<leader>fB", "<cmd>TimerStart 15m Long Break<CR>", { desc = "Start long break 🛋️" })
      vim.keymap.set("n", "<leader>fs", "<cmd>TimerStop<CR>", { desc = "Stop timer ⏹️" })
    end,
  },
}
