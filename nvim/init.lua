-- init.lua

-- require("impatient")
require("neo.setting")
require("neo.neovide")
require("neo.plugins").ensure_packer().setup()

require("neo.plugins").post_conf()
require("neo.plugins").keybind()
require("neo.keybind").register_keymap()
