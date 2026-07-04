local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
	completion = { documentation = { auto_show = true } },
})
