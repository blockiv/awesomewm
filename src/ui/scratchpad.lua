local bling = require("src.modules.bling")

local term_scratch = bling.module.scratchpad {
    command = "st -c Scratchpad",
    rule = { class = "Scratchpad" },
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = { x = 360, y = 120, height = 900, width = 1200 },
    reapply = true,
    dont_focus_before_close = false
}

return term_scratch
