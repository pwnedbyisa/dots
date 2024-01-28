local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
    return
end

local dashboard = require('alpha.themes.dashboard')

local header = {
        "",
    "",
    "",
    "                            _/      _/_/_/_/_/                          _/                 ",
    "   _/    _/  _/      _/  _/_/    _/          _/  _/_/_/    _/      _/      _/_/_/  _/_/    ",
    "    _/_/    _/      _/    _/  _/    _/_/_/  _/  _/    _/  _/      _/  _/  _/    _/    _/   ",
    " _/    _/    _/  _/      _/  _/  _/    _/  _/  _/    _/    _/  _/    _/  _/    _/    _/    ",
    "_/    _/      _/        _/  _/    _/_/_/_/    _/    _/      _/      _/  _/    _/    _/     ",
    "                             _/                                                            ",
    "                              _/_/_/_/_/_/                                                 ",
    "",
    "       01111000 01110110 00110001 01000000 01101110 01110110 01101001 01101101",
}

dashboard.section.header.val = header

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('SPC f f', '  Find file', ':Telescope find_files<CR>'),
  dashboard.button('SPC f g', '  Grep files', ':Telescope grep_string<CR>'),
  dashboard.button('SPC l u', '  Update plugins', ':Lazy update<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}


-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' - ' .. datetime
end


dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
