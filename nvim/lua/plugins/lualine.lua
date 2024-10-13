return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local fn = vim.fn

    local colors = {
      bg = "#282828",
      fg = "#ebdbb2",
      red = "#fb4934",
      green = "#b8bb26",
      blue = "#83a598",
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
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
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
      padding = { left = 0, right = 0 },
    })

    ins_left({
      function()
        return ""
      end,
      color = { fg = colors.red },
      padding = { left = 1, right = 1 },
    })

    ins_left({
      "filename",
      color = { gui = "bold" },
    })

    ins_left({ "filesize" })

    ins_left({
      "branch",
      icon = "",
      color = { fg = colors.red, gui = "bold" },
    })

    ins_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.green },
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
    })

    ins_right({ "o:encoding" })

    ins_right({
      "fileformat",
      icons_enabled = true,
    })

    ins_right({
      "progress",
      color = { gui = "bold" },
    })

    ins_right({
      "location",
      color = { gui = "bold" },
    })

    ins_right({
      function()
        return "▊"
      end,
      color = { fg = colors.blue },
      padding = { left = 0, right = 0 },
    })

    require("lualine").setup(config)
  end,
}
