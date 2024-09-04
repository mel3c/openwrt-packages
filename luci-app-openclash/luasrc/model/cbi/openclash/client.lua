local NXFS = require "nixio.fs"
local SYS  = require "luci.sys"
local HTTP = require "luci.http"
local DISP = require "luci.dispatcher"
local UTIL = require "luci.util"
local fs = require "luci.openclash"
local uci = require("luci.model.uci").cursor()

m = SimpleForm("openclash")
m.reset = false
m.submit = false

m:section(SimpleSection).template  = "openclash/status"

local t = {
    {enable, disable}
}

ss = m:section(Table, t)

o = ss:option(Button, "enable", " ")
o.inputtitle = translate("Enable OpenClash")
o.inputstyle = "apply"
o.write = function()
	uci:set("openclash", "config", "enable", 1)
	uci:commit("openclash")
	SYS.call("/etc/init.d/openclash restart >/dev/null 2>&1 &")
end

o = ss:option(Button, "disable", " ")
o.inputtitle = translate("Disable OpenClash")
o.inputstyle = "reset"
o.write = function()
	uci:set("openclash", "config", "enable", 0)
	uci:commit("openclash")
	SYS.call("/etc/init.d/openclash stop >/dev/null 2>&1 &")
end

dler = SimpleForm("openclash")
dler.reset = false
dler.submit = false
dler:section(SimpleSection).template  = "openclash/dlercloud"

if uci:get("openclash", "config", "dler_token") then
	return m, dler, ap
else
	return m, ap
end
