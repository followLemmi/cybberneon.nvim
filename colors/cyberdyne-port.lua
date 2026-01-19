-- cyberdyne-port theme for Neovim
-- Based on Ghostty Cyberdyne color scheme

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "cyberdyne-port"

-- Color Palette from Ghostty Cyberdyne
local colors = {
  -- ANSI colors
  black = "#080808",
  red = "#ff8373",
  green = "#00c172",
  yellow = "#d2a700",
  blue = "#0071cf",
  magenta = "#ff90fe",
  cyan = "#6bffdd",
  white = "#f1f1f1",
  
  -- Bright colors
  bright_black = "#2e2e2e",
  bright_red = "#ffc4be",
  bright_green = "#d6fcba",
  bright_yellow = "#fffed5",
  bright_blue = "#c2e3ff",
  bright_magenta = "#ffb2fe",
  bright_cyan = "#e6e7fe",
  bright_white = "#ffffff",
  
  -- Special colors
  background = "#151144",
  foreground = "#00ff92",
  cursor = "#00ff9c",
  cursor_text = "#ffffff",
  selection_bg = "#454d96",
  selection_fg = "#f4f4f4",
  
  -- Additional shades for UI
  bg_dark = "#0d0a2f",
  bg_light = "#1d1755",
  border = "#2e2866",
  comment = "#6b6b9d",
}

-- Helper function to set highlight groups
local function hi(group, opts)
  local cmd = "highlight " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.style then cmd = cmd .. " gui=" .. opts.style end
  if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
  vim.cmd(cmd)
end

-- Editor UI
hi("Normal", { fg = colors.foreground, bg = colors.background })
hi("NormalFloat", { fg = colors.foreground, bg = colors.bg_dark })
hi("NormalNC", { fg = colors.foreground, bg = colors.background })
hi("Cursor", { fg = colors.cursor_text, bg = colors.cursor })
hi("CursorLine", { bg = colors.bg_light })
hi("CursorLineNr", { fg = colors.yellow, style = "bold" })
hi("LineNr", { fg = colors.comment })
hi("Visual", { fg = colors.selection_fg, bg = colors.selection_bg })
hi("VisualNOS", { fg = colors.selection_fg, bg = colors.selection_bg })

-- Window elements
hi("StatusLine", { fg = colors.foreground, bg = colors.bg_light })
hi("StatusLineNC", { fg = colors.comment, bg = colors.bg_dark })
hi("WinBar", { fg = colors.cyan, bg = colors.background })
hi("WinBarNC", { fg = colors.comment, bg = colors.background })
hi("VertSplit", { fg = colors.border, bg = colors.background })
hi("WinSeparator", { fg = colors.border, bg = colors.background })
hi("SignColumn", { bg = colors.background })
hi("ColorColumn", { bg = colors.bg_dark })

-- Popups and floating windows
hi("Pmenu", { fg = colors.white, bg = colors.bg_light })
hi("PmenuSel", { fg = colors.cursor_text, bg = colors.blue })
hi("PmenuSbar", { bg = colors.bg_light })
hi("PmenuThumb", { bg = colors.comment })
hi("FloatBorder", { fg = colors.border, bg = colors.bg_dark })

-- Search
hi("Search", { fg = colors.background, bg = colors.yellow })
hi("IncSearch", { fg = colors.background, bg = colors.cyan })
hi("CurSearch", { fg = colors.background, bg = colors.magenta })

-- Messages
hi("ErrorMsg", { fg = colors.red, style = "bold" })
hi("WarningMsg", { fg = colors.yellow, style = "bold" })
hi("MoreMsg", { fg = colors.green })
hi("Question", { fg = colors.cyan })

-- Syntax Highlighting
hi("Comment", { fg = colors.comment, style = "italic" })
hi("Constant", { fg = colors.magenta })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.bright_green })
hi("Number", { fg = colors.magenta })
hi("Boolean", { fg = colors.magenta })
hi("Float", { fg = colors.magenta })

hi("Identifier", { fg = colors.cyan })
hi("Function", { fg = colors.cyan })

hi("Statement", { fg = colors.magenta })
hi("Conditional", { fg = colors.magenta })
hi("Repeat", { fg = colors.magenta })
hi("Label", { fg = colors.magenta })
hi("Operator", { fg = colors.foreground })
hi("Keyword", { fg = colors.magenta })
hi("Exception", { fg = colors.magenta })

hi("PreProc", { fg = colors.yellow })
hi("Include", { fg = colors.yellow })
hi("Define", { fg = colors.yellow })
hi("Macro", { fg = colors.yellow })
hi("PreCondit", { fg = colors.yellow })

hi("Type", { fg = colors.cyan })
hi("StorageClass", { fg = colors.magenta })
hi("Structure", { fg = colors.cyan })
hi("Typedef", { fg = colors.cyan })

hi("Special", { fg = colors.bright_magenta })
hi("SpecialChar", { fg = colors.bright_magenta })
hi("Tag", { fg = colors.blue })
hi("Delimiter", { fg = colors.white })
hi("SpecialComment", { fg = colors.comment, style = "bold" })
hi("Debug", { fg = colors.red })

hi("Underlined", { style = "underline", sp = colors.cyan })
hi("Ignore", { fg = colors.comment })
hi("Error", { fg = colors.red, style = "bold" })
hi("Todo", { fg = colors.background, bg = colors.yellow, style = "bold" })

-- Treesitter
hi("@variable", { fg = colors.white })
hi("@variable.builtin", { fg = colors.magenta })
hi("@variable.parameter", { fg = colors.bright_cyan })
hi("@variable.member", { fg = colors.cyan })

hi("@constant", { fg = colors.magenta })
hi("@constant.builtin", { fg = colors.magenta })
hi("@constant.macro", { fg = colors.yellow })

hi("@string", { fg = colors.green })
hi("@string.escape", { fg = colors.bright_magenta })
hi("@string.regexp", { fg = colors.bright_green })

hi("@number", { fg = colors.magenta })
hi("@boolean", { fg = colors.magenta })

hi("@function", { fg = colors.cyan })
hi("@function.builtin", { fg = colors.cyan })
hi("@function.call", { fg = colors.cyan })
hi("@function.macro", { fg = colors.yellow })

hi("@method", { fg = colors.cyan })
hi("@method.call", { fg = colors.cyan })

hi("@constructor", { fg = colors.cyan })
hi("@parameter", { fg = colors.bright_cyan })

hi("@keyword", { fg = colors.magenta })
hi("@keyword.function", { fg = colors.magenta })
hi("@keyword.operator", { fg = colors.magenta })
hi("@keyword.return", { fg = colors.magenta })

hi("@conditional", { fg = colors.magenta })
hi("@repeat", { fg = colors.magenta })
hi("@label", { fg = colors.magenta })
hi("@operator", { fg = colors.foreground })

hi("@exception", { fg = colors.magenta })

hi("@type", { fg = colors.cyan })
hi("@type.builtin", { fg = colors.cyan })
hi("@type.qualifier", { fg = colors.magenta })

hi("@property", { fg = colors.cyan })
hi("@field", { fg = colors.cyan })

hi("@punctuation.delimiter", { fg = colors.white })
hi("@punctuation.bracket", { fg = colors.white })
hi("@punctuation.special", { fg = colors.bright_magenta })

hi("@comment", { fg = colors.comment, style = "italic" })

hi("@tag", { fg = colors.blue })
hi("@tag.attribute", { fg = colors.cyan })
hi("@tag.delimiter", { fg = colors.white })

-- LSP
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })

hi("DiagnosticUnderlineError", { style = "underline", sp = colors.red })
hi("DiagnosticUnderlineWarn", { style = "underline", sp = colors.yellow })
hi("DiagnosticUnderlineInfo", { style = "underline", sp = colors.blue })
hi("DiagnosticUnderlineHint", { style = "underline", sp = colors.cyan })

hi("LspReferenceText", { bg = colors.bg_light })
hi("LspReferenceRead", { bg = colors.bg_light })
hi("LspReferenceWrite", { bg = colors.bg_light, style = "bold" })

-- Git
hi("DiffAdd", { fg = colors.green, bg = colors.bg_dark })
hi("DiffChange", { fg = colors.yellow, bg = colors.bg_dark })
hi("DiffDelete", { fg = colors.red, bg = colors.bg_dark })
hi("DiffText", { fg = colors.blue, bg = colors.bg_light })

hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Telescope
hi("TelescopeNormal", { fg = colors.foreground, bg = colors.bg_dark })
hi("TelescopeBorder", { fg = colors.border, bg = colors.bg_dark })
hi("TelescopePromptBorder", { fg = colors.border, bg = colors.bg_dark })
hi("TelescopeResultsBorder", { fg = colors.border, bg = colors.bg_dark })
hi("TelescopePreviewBorder", { fg = colors.border, bg = colors.bg_dark })
hi("TelescopeSelection", { fg = colors.foreground, bg = colors.selection_bg })
hi("TelescopeSelectionCaret", { fg = colors.cursor, bg = colors.selection_bg })
hi("TelescopeMatching", { fg = colors.yellow, style = "bold" })

-- Neo-tree / NvimTree
hi("NeoTreeNormal", { fg = colors.bright_cyan, bg = colors.bg_dark })
hi("NeoTreeNormalNC", { fg = colors.bright_cyan, bg = colors.bg_dark })
hi("NeoTreeDirectoryIcon", { fg = colors.cyan })
hi("NeoTreeDirectoryName", { fg = colors.cyan })
hi("NeoTreeFileName", { fg = colors.bright_cyan })
hi("NeoTreeFileIcon", { fg = colors.bright_cyan })
hi("NeoTreeGitAdded", { fg = colors.green })
hi("NeoTreeGitModified", { fg = colors.yellow })
hi("NeoTreeGitDeleted", { fg = colors.red })

-- Which-key
hi("WhichKey", { fg = colors.cyan })
hi("WhichKeyGroup", { fg = colors.blue })
hi("WhichKeyDesc", { fg = colors.white })
hi("WhichKeySeparator", { fg = colors.comment })
hi("WhichKeyFloat", { bg = colors.bg_dark })
hi("WhichKeyBorder", { fg = colors.border, bg = colors.bg_dark })

-- Dashboard / Alpha
hi("DashboardHeader", { fg = colors.cursor })
hi("DashboardCenter", { fg = colors.blue })
hi("DashboardFooter", { fg = colors.comment, style = "italic" })
hi("DashboardShortcut", { fg = colors.magenta })

-- Indent Blankline
hi("IndentBlanklineChar", { fg = colors.border })
hi("IndentBlanklineContextChar", { fg = colors.comment })

-- Noice
hi("NoiceCmdlinePopup", { fg = colors.foreground, bg = colors.bg_dark })
hi("NoiceCmdlinePopupBorder", { fg = colors.border, bg = colors.bg_dark })
hi("NoiceCmdlineIcon", { fg = colors.cyan })

return colors
