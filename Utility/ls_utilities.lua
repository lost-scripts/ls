-- **************************************************
-- Provide Moho with the name of this script object
-- **************************************************

ScriptName = "LS_Utilities"
ScriptBirth = "20220918-0248"
ScriptBuild = "20240717-0348"

-- **************************************************
-- General information about this script
-- **************************************************

LS_Utilities = LS_Utilities or {["ScriptName"] = ScriptName, ["ScriptBirth"] = ScriptBirth, ["ScriptBuild"] = ScriptBuild}

function LS_Utilities:Name(i)
	return ({"Lost Utilities", ScriptName = self.ScriptName, Short = "LSU", UUID = "0c48445e-2774-4701-8712-9be38418c85f"})[i or 1]
end

function LS_Utilities:Version(i)
	return ({"0.0.1", Build = self.ScriptBuild, App = "14.2"})[i or 1]
end

function LS_Utilities:Description(i)
	return ({MOHO.Localize("/LS_Utilities/Description=Lost utilities container. It provides a number of useful utilities, loads modules and is also an alternative way to extend them."), Type = "UtilityScript", LayerType = {[0] = MOHO.LT_UNKNOWN}})[i or 1]
end

function LS_Utilities:Creator(i)
	return ({"Rai López", Company = "Lost Scripts™", Team = "", Ack = {"Lost Marble team", "Supportive folks at Moho (Scripting) forum"}})[i or 1]
end

function LS_Utilities:UILabel(i)
	return ({MOHO.Localize("/LS_Utilities/Utilities=Lost Utilities"), Labels = "Utilities, Utility, Utils, Helpers, Help"})[i or 1] --"Lost Scripts Modules" --DON'T LOCALIZE!
end

function LS_Utilities:ColorizeIcon(i, j)
	return ({true, Icon = "🛠", Color = ({[0] = "#838383", "#DC4040", "#F0A000", "#F0F000", "#40DC40", "#4040DC", "#C060F0", "#D2B48C", "#FFC0CB", "#40E0D0", "#5F9EA0", "#FF7F50"})[j or 0]})[i or 1]
end --print(LS_Utilities:ColorizeIcon("Color", 2))

function LS_Utilities:Source(i, j)
	return ({"github.com/lost-scripts/ls", "bitbucket.org/lostscripts/ls", Web = ({"lost-scripts.github.io", "lostscripts.bitbucket.io"})[j or 1], Host = ({"github", "bitbucket"})[j or 1], User = ({"lost-scripts", "lostscripts"})[j or 1]})[i or 1]
end --print(LS_Utilities:Source("Web", 2))

function LS_Utilities:Location(f, l, s) --fullPath: 1, 3 --ScriptLocation()?
	return table.concat({debug.getinfo(1).source:sub(2, -#debug.getinfo(1, "S").source:match("[^/\\]*.lua$") - 1), debug.getinfo(1, "S").source:sub(2):match("[^/\\]*.lua$"):sub(0, -5), ".lua"}, s or "", f or 1, (l and l > f) and l or f or 1)
end

-- **************************************************
-- Recurring values
-- **************************************************

math.randomseed(os.time())
math.random()
math.random()
math.random()

-- **************************************************
-- Other MOHO utility functions...
-- **************************************************

--local cpath = "C:\Program Files\MB\?.dll;C:\Program Files\MB\..\lib\lua\5.4\?.dll;C:\Program Files\MB\loadall.dll;.\?.dll;C:\Program Files\MB\Resources\Support\Scripts\Modules\?.dll;D:\Ramon0\Projects\Moho Pro\Scripts\Modules\?.dll"
function MOHO.GetDir(paths, ext) --(str, str) str
	for path in string.gmatch(paths, "([^;]+)") do
		if string.find(path, "Moho Pro\\Scripts\\Modules") then
			return (ext and path:gsub("%?%.([^.]+)", "?." .. ext) or path) --return (ext and path:gsub("%?%.%a+$", "?." .. ext) or path) -- OPTION 2
		end
	end
end

function MOHO.GetAbsDir(path) --(str) str
	path = path or ""
	local absDir
	if lfs ~= nil then
		local oldDir = lfs.currentdir()
		lfs.chdir(path)
		absDir = lfs.currentdir()
		lfs.chdir(oldDir)
	else --just in case?
		local cmd = io.popen("cd /D " .. path .. " && cd")
		absDir = cmd:read("*a"):gsub("\n", "")
		cmd:close()
	end
	return absDir or path
end

function MOHO.GetLocation(rel) --(str) str
	rel = rel or ""
	local path = debug.getinfo(1).source:sub(2, -#debug.getinfo(1, "S").source:match("[^/\\]*.lua$") - 1) --"D:\\Ramon0\\Projects\\Moho Pro\\Scripts\\Modules\\?.lua"
	return path .. rel
end

-- LS Utilities' Properties/Constants:
MOHO.MohoGlobals.UserUtilityDir = debug.getinfo(1).source:sub(2, -#debug.getinfo(1, "S").source:match("[^/\\]*.lua$") - 1) --local script_path = (debug.getinfo(1).source:match("@?(.*)[\\/][^\\/]+$") or ".") .. package.config:sub(1,1)
MOHO.MohoGlobals.UserModulesDir = MOHO.GetAbsDir(MOHO.MohoGlobals.UserUtilityDir ..  "..\\Modules\\")
MOHO.MohoGlobals.UserResourcesDir = MOHO.GetAbsDir(MOHO.MohoGlobals.UserUtilityDir and MOHO.MohoGlobals.UserUtilityDir .. "..\\ScriptResources" or "\\ScriptResources")
MOHO.MohoGlobals.UserScriptsDir = MOHO.GetAbsDir(MOHO.MohoGlobals.UserUtilityDir .. "..\\")
MOHO.MohoGlobals.UserAppDir = MOHO.GetAbsDir(MOHO.MohoGlobals.UserUtilityDir .. "..\\..\\")

-- **************************************************
-- Load/Preload LS Module & Submodules
-- **************************************************
 
local path = MOHO.GetDir(package.cpath, "lua") --local path2 = MOHO.ScriptInterface:UserAppDir() .. "\\Scripts\\Modules\\?.lua" --(20230716-1706)
if not string.find(package.path, MOHO.MohoGlobals.UserUtilityDir, 1, true) and not string.find(package.path, path, 1, true) then -- busca la ruta como una cadena literal en toda package.path
	package.path = package.path .. ";" .. MOHO.MohoGlobals.UserUtilityDir .. "..\\Modules\\?.lua" .. ";" .. path --print(package.path)
end

-- Modules loading...
package.loaded["ls_modules"] = nil --Ensures the module is loaded upon reloading tools and brushes!
LS = require("ls_modules")

-- **************************************************
-- LS utility functions...
-- **************************************************

function LS_Utilities.RandomInt(min, max)
	local f = math.random()
	return LM.Round(LM.Lerp(f, min, max))
end

-- **************************************************
-- Other LS module utility functions...
-- **************************************************

function LS.RandomInt(min, max)
	local f = math.random()
	return LM.Round(LM.Lerp(f, min, max))
end