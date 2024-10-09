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
      yellow = "#fabd2f",
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
      color = function()
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          V = colors.yellow,
        }
        return { fg = mode_color[fn.mode()] }
      end,
      padding = { left = 1, right = 1 },
    })

    ins_left({
      "filename",
      color = { gui = "bold" },
    })

    ins_left({
      "filesize",
    })

    ins_left({
      "branch",
      icon = "",
      color = { fg = colors.red, gui = "bold" },
    })

    ins_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
      colored = true,
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
      colored = true,
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

    ins_right({ "location" })

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
