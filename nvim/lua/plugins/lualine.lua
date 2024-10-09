return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local fn = vim.fn
    local lualine = require("lualine")

    local colors = {
      bg = "#282828",
      fg = "#ebdbb2",
      red = "#fb4934",
      green = "#b8bb26",
      yellow = "#fabd2f",
      blue = "#83a598",
      purple = "#d3869b",
      aqua = "#8ec07c",
      orange = "#fe8019",
    }

    local conditions = {
      buffer_not_empty = function()
        return fn.empty(fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = fn.expand("%:p:h")
        local gitdir = fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        ignore_focus = { "neo-tree" },
        theme = {
          normal = { c = { bg = colors.bg, fg = colors.fg } },
          inactive = { c = { bg = colors.bg, fg = colors.fg } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      function()
        return "▊"
      end,
      color = { fg = colors.blue },
      padding = { left = 0, right = 1 },
    })

    ins_left({
      function()
        return " "
      end,
      color = function()
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.red,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.purple,
          Rv = colors.purple,
          cv = colors.red,
          ce = colors.red,
          r = colors.aqua,
          rm = colors.aqua,
          ["r?"] = colors.aqua,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[fn.mode()] }
      end,
      padding = { left = 0 },
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { gui = "bold" },
    })

    ins_left({
      "filesize",
      cond = conditions.buffer_not_empty,
    })

    ins_left({
      "branch",
      icon = "",
      color = { fg = colors.red, gui = "bold" },
    })

    ins_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_right({
      function()
        local msg = ""
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
            return " " .. client.name
          end
        end
        return msg
      end,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = {
        error = "󰅚 ",
        warn = "󰀪 ",
        hint = "󰌶 ",
        info = " ",
      },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        hint = { fg = colors.green },
        info = { fg = colors.aqua },
      },
    })

    ins_right({
      "o:encoding",
      cond = conditions.hide_in_width,
      color = { gui = "bold" },
    })

    ins_right({
      "fileformat",
      icons_enabled = true,
      color = { gui = "bold" },
    })

    ins_right({
      "progress",
      color = { gui = "bold" },
    })

    ins_right({ "location" })

    ins_right({
      function()
        return "▊"
      end,
      color = { fg = colors.blue },
      padding = { right = 0 },
    })

    lualine.setup(config)
  end,
}
