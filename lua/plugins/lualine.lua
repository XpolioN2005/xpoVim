return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        theme = "kanagawa",
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filename" },
          {
            function()
              local cwd = vim.fn.getcwd()
              local home = vim.fn.expand("~")
              local drive = cwd:match("^%a:/") or ""
              local display = ""

              -- replace home path with ~
              if cwd:sub(1, #home) == home then
                display = "~"
                cwd = cwd:sub(#home + 2)
              end

              -- get last two folders
              local parts = {}
              for part in cwd:gmatch("[^/\\]+") do
                table.insert(parts, part)
              end
              local last_two = ""
              if #parts >= 2 then
                last_two = parts[#parts-1] .. "/" .. parts[#parts]
              elseif #parts == 1 then
                last_two = parts[1]
              end

              if display == "~" then
                return drive .. " " .. display .. "/" .. last_two
              else
                return drive .. last_two
              end
            end,
            icon = "",
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }
  end,
}
