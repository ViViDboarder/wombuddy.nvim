-- Name: Wombuddy
-- Description: Wombat colorscheme for Neovim
-- Author: ViViDboarder
local Color, c, Group, g, s = require("colorbuddy").setup()
local b = s.bold
local i = s.italic
local n = s.inverse
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local sto = s.standout
local no = s.NONE

local M = {}

function M.enable()
    vim.g.colors_name = "wombuddy"
    -- TODO: Maybe offer a light variant in the future
    vim.o.background = "dark"

    -- Create Primary Colors based on iTerm 2 colorscheme
    Color.new("Black", "#000000")
    Color.new("Red", "#ff786c")
    Color.new("DarkRed", c.Red:dark():to_rgb())
    Color.new("Green", "#bde97c")
    Color.new('DarkGreen', c.Green:dark():to_rgb())
    Color.new("Yellow", "#efdeab")
    Color.new("DarkYellow", c.yellow:dark():to_rgb())
    Color.new("Blue", "#6eb9f8")
    Color.new("DarkBlue", c.Blue:dark():to_rgb())
    Color.new("Magenta", "#ee87ff")
    Color.new("DarkMagenta", c.Magenta:dark():to_rgb())
    Color.new("Cyan", "#90fdf8")
    Color.new("DarkCyan", c.Cyan:dark():to_rgb())
    Color.new("White",  "#e4e0d7")

    Color.new("Orange", "#e5786d")
    Color.new("DarkOrange", c.Orange:dark():to_rgb())
    Color.new("Purple", "#d787ff")
    Color.new('Violet', "#b294bb")
    Color.new("Grey", "#574b49")
    Color.new("Aqua", c.Cyan:to_rgb())
    Color.new('Pink', c.Red:light():to_rgb())

    -- A few grey scales
    Color.new("grey_1", "#c3c6ca")
    Color.new("grey_2", "#9c998e")
    Color.new("grey_3", "#636066")
    Color.new("grey_4", "#574b49")
    Color.new("grey_5", "#444444")

    -- Set some fg/bg colors
    Color.new("dark_fg", "#e4e0d7")
    Color.new("dark_bg", "#1e1e1e")

    -- Override some colors used in colorbuddy plugins
    Color.new("GreenBg", c.darkgreen:to_rgb())
    Color.new("RedBg", c.darkred:to_rgb())

    --[[
    -- Mostly based on wombat256mod
    Color.new("Red", "#ff5f55")
    Color.new("DarkRed", "#e06c75")
    Color.new("Blue", "#88b8f6")
    Color.new("DarkBlue", "#528bff")
    Color.new("Green", "#95e454")
    Color.new('DarkGreen', "#50a14f")
    Color.new("Orange", "#e5786d")
    Color.new("DarkOrange", "#c18401")
    Color.new("Yellow", "#cae982")
    Color.new("DarkYellow", c.yellow:dark():to_rgb())
    Color.new("Purple", "#d787ff")
    Color.new('Violet', "#b294bb")
    Color.new("Magenta", "#ff80ff")
    Color.new("DarkMagenta", "#a626a4")
    Color.new("Black", "#242424")
    Color.new("Grey", "#a0a8b0")
    Color.new("White",  "#e3e0d7")
    Color.new("Cyan", "#56B6C2")
    Color.new("DarkCyan", "#80a0ff")
    Color.new("Aqua", "#8ec07c")
    Color.new('Pink', "#d291e4")

    Color.new("fg", c.white)
    Color.new("bg", c.black)
    --]]

    -- Create palette

    -- TODO: Move these refrence groups rather than colors
    Color.new("error_red", "#ff2026")
    Color.new("line_grey", c.Grey:to_rgb())
    Color.new("gutter_fg_grey", "#857b6f")
    Color.new("cursor_grey", "#32322f")
    Color.new("visual_grey", "#c3c6ca")  -- Alternate #554d4b
    Color.new("menu_grey", "#444444")
    Color.new("special_grey", "#857b6f")
    Color.new("special_yellow", c.DarkYellow:to_rgb())
    Color.new("vertsplit", "#444444")

    -- Determine if we'll use italics
    local italics = (function()
        if vim.g.wombuddy_disable_italics ~= true then
            return i
        else
            return no
        end
    end)()

    -- Colors
    Group.new("Normal", c.dark_fg, c.dark_bg, no)
    Group.new("bold", c.none, c.none, b)

    Group.new("Comment", c.grey_2, c.none, italics)
    Group.new("Constant", c.orange, c.none, no)
    Group.new("String", c.green, c.none, no)
    Group.new("Character", c.green, c.none, no)
    Group.new("Number", c.orange, c.none, no)
    Group.new("Boolean", c.blue, c.none, no)
    Group.new("Float", c.orange, c.none, no)
    Group.new("Identifier", c.yellow, c.none, no)
    Group.new("Function", c.yellow, c.none, no)
    Group.new("Statement", c.blue, c.none, no)
    Group.new("Conditional", c.purple, c.none, no)
    Group.new("Repeat", c.purple, c.none, no)
    Group.new("Label", c.blue, c.none, no)
    Group.new("Operator", c.purple, c.none, no)
    Group.new("Keyword", c.blue, c.none, no)
    Group.new("Exception", c.purple, c.none, no)
    Group.new("PreProc", c.orange, c.none, no)
    Group.new("Include", c.purple, c.none, no)
    Group.new("Define", c.purple, c.none, no)
    Group.new("Title", c.cyan, c.none, no)
    Group.new("Macro", c.purple, c.none, no)
    Group.new("PreCondit", c.blue, c.none, no)
    Group.new("Type", c.blue, c.none, no)
    Group.new("StorageClass", c.blue, c.none, no)
    Group.new("Structure", c.yellow, c.none, no)
    Group.new("Typedef", c.yellow, c.none, no)
    Group.new("Special", c.special_yellow, c.none, italics)
    Group.new("SpecialComment", c.special_yellow, c.none, no)
    Group.new("Error", c.error_red, c.none, b + r)
    Group.new("Todo", c.purple, c.none, b + italics)
    Group.new("Underlined", c.cyan, c.none, u)
    Group.new("Cursor", c.none, c.none, r)

    Group.new("ColorColumn", c.none, c.cursor_grey, no)
    Group.new("CursorLineNr", c.white, c.none, b)
    Group.new("SignColumn", c.none, c.dark_bg:light(), no)
    Group.new("Conceal", c.line_grey, c.none, no)
    Group.new("CursorColumn", c.none, c.cursor_grey, no)
    Group.new("CursorLine", c.none, c.cursor_grey, no)
    Group.new("Directory", c.blue, c.none, no)

    Group.new("DiffChange", c.yellow, c.none, u)
    Group.new("DiffAdd", c.none, c.greenbg, no)
    Group.new("DiffDelete", c.none, c.redbg, no)
    Group.new("DiffText", c.black, c.yellow, no)

    Group.new("ErrorMsg", c.error_red, c.none, no)
    Group.new("VertSplit", c.vertsplit, c.none, no)
    Group.new("Folded", c.line_grey, c.none, no)
    Group.new("FoldColumn", c.none, c.none, no)
    Group.new("IncSearch", c.yellow, c.line_grey, no)
    Group.new("LineNr", c.gutter_fg_grey, c.none, no)
    Group.new("MatchParen", c.blue, c.none, u)
    Group.new("NonText", c.special_grey, c.none, no)
    Group.new("Pmenu", c.white, c.menu_grey, no)
    Group.new("PmenuSel", c.black, c.yellow, no)
    Group.new("PmenuSbar", c.none, c.special_grey, no)
    Group.new("PmenuThumb", c.none, c.white, no)
    Group.new("Question", c.purple, c.none, no)
    Group.new("QuickFixLine", c.black, c.yellow, no)
    Group.new("Search", c.black, c.yellow, no)
    Group.new("SpecialKey", c.special_grey, c.none, no)
    Group.new("SpellBad", c.error_red, c.none, u)
    Group.new("SpellCap", c.yellow, c.none, no)
    Group.new("SpellLocal", c.yellow, c.none, no)
    Group.new("SpellRare", c.yellow, c.none, no)
    Group.new("StatusLine", c.white, c.cursor_grey, no)
    Group.new("StatusLineNC", c.line_grey, c.none, no)
    Group.new("StatusLineTerm", c.white, c.cursor_grey, no)
    Group.new("StatusLineTermNC", c.cursor_grey, c.none, no)
    Group.new("TabLine", c.line_grey, c.none, no)
    Group.new("TabLineSel", c.white, c.none, no)
    Group.new("TabLineFill", c.none, c.bg, no)
    Group.new("Terminal", c.white, c.black, no)
    Group.new("Visual", c.none, c.visual_grey, no)
    Group.new("VisualNOS", c.visual_grey, c.none, no)
    Group.new("WarningMsg", c.yellow, c.none, no)
    Group.new("WildMenu", c.black, c.blue, no)
    Group.new("EndOfBuffer", c.black, c.none, no)

    -- -- Start Treesitter --
    -- Misc
    Group.new("TSError", c.error_red, c.none, no)
    Group.new("TSPunctDelimiter", c.white, c.none, no)
    Group.new("TSPunctBracket", c.white, c.none, no)
    Group.new("TSPunctSpecial", c.white, c.none, no)
    -- Constants
    Group.new("TSConstant", c.blue, c.none, no)
    Group.new("TSConstBuiltin", c.orange, c.none, no)
    -- Not sure about this guy
    Group.new("TSConstMacro", c.cyan, c.none, no)
    Group.new("TSStringRegex", c.green, c.none, no)
    Group.new("TSString", c.green, c.none, no)
    Group.new("TSStringEscape", c.cyan, c.none, no)
    Group.new("TSCharacter", c.green, c.none, no)
    Group.new("TSNumber", c.orange, c.none, no)
    Group.new("TSBoolean", c.orange, c.none, no)
    Group.new("TSFloat", c.green, c.none, no)
    Group.new("TSAnnotation", c.yellow, c.none, no)
    Group.new("TSAttribute", c.cyan, c.none, no)
    Group.new("TSNamespace", c.purple, c.none, no)
    -- Functions
    Group.new("TSFuncBuiltin", c.yellow, c.none, no)
    Group.new("TSFunction", c.yellow, c.none, no)
    Group.new("TSFuncMacro", c.yellow, c.none, no)
    Group.new("TSParameter", c.cyan, c.none, no)
    Group.new("TSParameterReference", c.cyan, c.none, no)
    Group.new("TSMethod", c.blue, c.none, no)
    Group.new("TSField", c.red, c.none, no)
    Group.new("TSProperty", c.yellow, c.none, no)
    Group.new("TSConstructor", c.cyan, c.none, no)
    -- Keywords
    Group.new("TSConditional", c.purple, c.none, no)
    Group.new("TSRepeat", c.purple, c.none, no)
    Group.new("TSLabel", c.blue, c.none, no)
    -- Does not work for yield and return they should be diff then class and def
    Group.new("TSKeyword", c.purple, c.none, no)
    Group.new("TSKeywordFunction", c.blue, c.none, no)
    Group.new("TSKeywordOperator", c.purple, c.none, no)
    Group.new("TSOperator", c.white, c.none, no)
    Group.new("TSException", c.purple, c.none, no)
    Group.new("TSType", c.blue, c.none, no)
    Group.new("TSTypeBuiltin", c.blue, c.none, no)
    Group.new("TSStructure", c.purple, c.none, no)
    Group.new("TSInclude", c.purple, c.none, no)
    -- Variable
    Group.new("TSVariable", c.cyan, c.none, no)
    Group.new("TSVariableBuiltin", c.yellow, c.none, no)
    -- Text
    Group.new("TSText", c.pink, c.none, no)
    Group.new("TSStrong", c.pink, c.none, no)
    Group.new("TSEmphasis", c.pink, c.none, no)
    Group.new("TSUnderline", c.pink, c.none, no)
    Group.new("TSTitle", c.pink, c.none, no)
    Group.new("TSLiteral", c.pink, c.none, no)
    Group.new("TSURI", c.pink, c.none, no)
    Group.new("TSComment", g.comment, c.none, no)
    -- Tags
    Group.new("TSTag", c.red, c.none, no)
    Group.new("TSTagDelimiter", c.line_grey, c.none, no)
    -- -- END Treesitter --

    -- -- START Languages --
    -- HTML (keep consistent with Markdown, below)
    Group.new("htmlArg", c.yellow, c.none, no)
    Group.new("htmlBold", c.yellow, c.none, b)
    Group.new("htmlEndTag", c.white, c.none, no)
    Group.new("htmlH1", c.blue, c.none, no)
    Group.new("htmlH2", c.blue:light(), c.none, no)
    Group.new("htmlH3", c.blue:light(), c.none, no)
    Group.new("htmlH4", c.blue:light(), c.none, no)
    Group.new("htmlH5", c.blue:light(), c.none, no)
    Group.new("htmlH6", c.blue:light(), c.none, no)
    Group.new("htmlItalic", c.purple, c.none, i)
    Group.new("htmlLink", c.cyan, c.none, u)
    Group.new("htmlSpecialChar", c.yellow, c.none, no)
    Group.new("htmlSpecialTagName", c.blue, c.none, no)
    Group.new("htmlTag", c.white, c.none, no)
    Group.new("htmlTagN", c.blue, c.none, no)
    Group.new("htmlTagName", c.blue, c.none, no)
    Group.new("htmlTitle", c.white, c.none, no)

    -- Markdown
    Group.new("markdownBlockquote", c.line_grey, c.none, no)
    Group.new("markdownBold", g.htmlBold.fg, g.htmlBold.bg, b)
    Group.new("markdownCode", c.green, c.none, no)
    Group.new("markdownCodeBlock", c.green, c.none, i)
    Group.new("markdownCodeDelimiter", c.green, c.none, i)
    Group.new("markdownH1", g.htmlH1.fg, g.htmlH1.bg, b + italics)
    Group.new("markdownH2", g.htmlH2.fg, g.htmlH2.bg, b)
    Group.new("markdownH3", g.htmlH3.fg, g.htmlH3.bg, italics)
    Group.new("markdownH4", g.htmlH4.fg, g.htmlH4.bg, no)
    Group.new("markdownH5", g.htmlH5.fg, g.htmlH5.bg, no)
    Group.new("markdownH6", g.htmlH6.fg, g.htmlH6.bg, no)
    Group.new("markdownHeadingDelimiter", c.red, c.none, no)
    Group.new("markdownHeadingRule", c.line_grey, c.none, no)
    Group.new("markdownId", c.purple, c.none, no)
    Group.new("markdownIdDeclaration", c.blue, c.none, no)
    Group.new("markdownIdDelimiter", c.purple, c.none, no)
    Group.new("markdownItalic", g.htmlItalic.fg, g.htmlItalic.bg, i)
    Group.new("markdownLinkDelimiter", c.purple, c.none, no)
    Group.new("markdownLinkText", g.htmlLink.fg, g.htmlLink.bg, no)
    Group.new("markdownListMarker", c.red, c.none, no)
    Group.new("markdownOrderedListMarker", c.red, c.none, no)
    Group.new("markdownRule", c.line_grey, c.none, no)
    Group.new("markdownUrl", c.cyan, c.none, u)
    -- -- END Languages --

    -- -- START CoC --
    Group.new("CocExplorerIndentLine", c.line_grey, c.none, no)
    Group.new("CocExplorerBufferRoot", c.cyan, c.none, no)
    Group.new("CocExplorerFileRoot", c.cyan, c.none, no)
    Group.new("CocExplorerBufferFullPath", c.line_grey, c.none, no)
    Group.new("CocExplorerFileFullPath", c.line_grey, c.none, no)
    Group.new("CocExplorerBufferReadonly", c.purple, c.none, no)
    Group.new("CocExplorerBufferModified", c.purple, c.none, no)
    Group.new("CocExplorerBufferNameVisible", c.green, c.none, no)
    Group.new("CocExplorerFileReadonly", c.purple, c.none, no)
    Group.new("CocExplorerFileModified", c.purple, c.none, no)
    Group.new("CocExplorerFileHidden", c.line_grey, c.none, no)
    Group.new("CocExplorerHelpLine", c.purple, c.none, no)
    -- -- END CoC --

    -- -- START Easymotion --
    Group.new("EasyMotionTarget", c.error_red, c.none, b)
    Group.new("EasyMotionTarget2First", c.error_red, c.none, b)
    Group.new("EasyMotionTarget2Second", c.error_red, c.none, b)
    -- EasyMotionShade: ""
    -- EasyMotionIncSearch:
    -- EasyMotionMoveHL:

    -- -- END Easymotion --

    -- -- START Startify --
    Group.new("StartifyNumber", c.orange, c.none, no)
    Group.new("StartifySelect", c.green, c.none, no)
    Group.new("StartifyBracket", c.blue, c.none, no)
    Group.new("StartifySpecial", c.cyan, c.none, no)
    Group.new("StartifyVar", c.blue, c.none, no)
    Group.new("StartifyPath", c.cyan, c.none, no)
    Group.new("StartifyFile", c.yellow, c.none, no)
    Group.new("StartifySlash", c.white, c.none, no)
    Group.new("StartifyHeader", c.green, c.none, no)
    Group.new("StartifySection", c.purple, c.none, no)
    Group.new("StartifyFooter", c.green, c.none, no)
    -- -- END Startify --

    -- -- START WhichKey --
    Group.new("WhichKey", c.purple, c.none, no)
    Group.new("WhichKeySeperator", c.green, c.none, no)
    Group.new("WhichKeyGroup", c.blue, c.none, no)
    Group.new("WhichKeyDesc", c.blue, c.none, no)
    -- -- END WhichKey --

    -- old stuff
    Group.new("diffAdded", c.green, c.none, no)
    Group.new("diffRemoved", c.red, c.none, no)
    Group.new("diffFileId", c.blue, c.none, br)
    Group.new("diffFile", c.special_grey, c.none, no)
    Group.new("diffNewFile", c.green, c.none, no)
    Group.new("diffOldFile", c.red, c.none, no)

    Group.new("debugPc", c.none, c.cyan, no)
    Group.new("debugBreakpoint", c.red, c.none, r)

    -- VimWiki
    Group.new("VimwikiHeader1", c.orange, c.none, b)
    Group.new("VimwikiHeader2", c.green, c.none, b)
    Group.new("VimwikiHeader3", c.blue, c.none, b)
    Group.new("VimwikiHeader4", c.cyan, c.none, b)
    Group.new("VimwikiHeader5", c.yellow, c.none, b)
    Group.new("VimwikiHeader6", c.purple, c.none, b)
    Group.new("VimwikiLink", c.cyan, c.none, no)
    Group.new("VimwikiHeaderChar", c.line_grey, c.none, no)
    Group.new("VimwikiHR", c.yellow, c.none, no)
    Group.new("VimwikiList", c.orange, c.none, no)
    Group.new("VimwikiTag", c.orange, c.none, no)
    Group.new("VimwikiMarkers", c.line_grey, c.none, no)
end

-- Return module that allows ren-enabling
return M
