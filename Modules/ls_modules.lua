-- **************************************************
-- Provide Moho with the name of this script object
-- **************************************************

ScriptName = "LS"
ScriptBirth = "20220918-0248"
ScriptBuild = "20240717-0348"

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
--LS = LS or {} -- Module LS (MohoDoc, MohoLayer, SS, SSI, SSS, ColorOps, OS, String)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

-- **************************************************
-- General information about this script
-- **************************************************

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
LS = LS or {["ScriptName"] = ScriptName, ["ScriptBirth"] = ScriptBirth, ["ScriptBuild"] = ScriptBuild} -- Module LS (MohoDoc, MohoLayer, SS, SSI, SSS, ColorOps, OS, String)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

function LS:Name(i)
	return ({"Lost Modules", ScriptName = self.ScriptName, Short = "LSM", UUID = "1b310067-35f4-425e-8796-624e70a1492b"})[i or 1]
end

function LS:Version(i)
	return ({"0.0.1", Build = self.ScriptBuild, App = "14.2"})[i or 1]
end

function LS:Description(i)
	return ({MOHO.Localize("/LS/Description=Lost modules container. Contains all the necessary modules for the well operation of Lost Scripts™."), Type = "ModuleScript", LayerType = {[0] = MOHO.LT_UNKNOWN}})[i or 1]
end

function LS:Creator(i)
	return ({"Rai López", Company = "Lost Scripts™", Team = "", Ack = {"Lost Marble team", "Supportive folks at Moho (Scripting) forum"}})[i or 1]
end

function LS:UILabel(i)
	return ({MOHO.Localize("/LS/Modules=Lost Modules"), Labels = "Modules, Development, Programming, Scripting, API, Lua, Interfaces"})[i or 1] --"Lost Scripts Modules" --DON'T LOCALIZE!
end

function LS:ColorizeIcon(i, j)
	return ({true, Icon = "Ⓜ", Color = ({[0] = "#838383", "#DC4040", "#F0A000", "#F0F000", "#40DC40", "#4040DC", "#C060F0", "#D2B48C", "#FFC0CB", "#40E0D0", "#5F9EA0", "#FF7F50"})[j or 0]})[i or 1]
end --print(LS:ColorizeIcon("Color", 2))

function LS:Source(i)
	return ({"github.com/lost-scripts/ls", Web = "lost-scripts.github.io", Host = "github", User = "lost-scripts"})[i or 1]
end

function LS:Location(f, l, s) --fullPath: 1, 3 --ScriptLocation()?
	return table.concat({debug.getinfo(1).source:sub(2, -#debug.getinfo(1, "S").source:match("[^/\\]*.lua$") - 1), debug.getinfo(1, "S").source:sub(2):match("[^/\\]*.lua$"):sub(0, -5), ".lua"}, s or "", f or 1, (l and l > f) and l or f or 1)
end

-- LS Module's Properties (deprecate favor of functions system above?) & Constants:

LS.Name = "LS Modules"
LS.Icon = "Ⓜ"
LS.ScriptName = ScriptName
LS.Type = "ModuleScript"
LS.Creator = "Rai López"
LS.Company = "Lost Scripts™"
LS.Description = "Contains all the necessary modules for the operation of Lost Scripts (The Lost Scripts modules container)."
LS.Version = "0.0.1"
LS.Host = "github"
LS.HostUser = "lost-scripts"
LS.Url = LS.Host .. ".com/" .. LS.HostUser .. "/" .. LS.ScriptName
LS.Web = LS.HostUser .. "." .. LS.Host .. ".io"
LS.Location = debug.getinfo(1).source:sub(2, -#debug.getinfo(1, "S").source:match("[^/\\]*.lua$") - 1)

-- Layer Types
--MOHO.LT_CHILD = -2
--MOHO.LT_ROOT = -1

LS.LT_UNKNOWN = 2 -- 0
LS.LT_VECTOR = 4 -- 1
LS.LT_IMAGE = 8 -- 2
LS.LT_GROUP = 16 -- 3
LS.LT_BONE = 32 -- 4
LS.LT_SWITCH = 64 -- 5
LS.LT_PARTICLE = 128 -- 6
LS.LT_NOTE = 256 -- 7
LS.LT_3D = 512 -- 8
LS.LT_AUDIO = 1024 -- 9
LS.LT_PATCH = 2048 -- 10
LS.LT_TEXT = 4096 -- 11
LS.LT_ROOT = 2097152 -- 20
LS.LT_CHILD = 4194304 -- 21

LS.LT_FLAGS = {}
LS.LT_FLAGS[MOHO.LT_UNKNOWN] = 2; LS.LT_FLAGS["UNKNOWN"] = 2 -- 0
LS.LT_FLAGS[MOHO.LT_VECTOR] = 4; LS.LT_FLAGS["VECTOR"] = 4; LS.LT_FLAGS[-MOHO.LT_VECTOR] = "VECTOR" -- 1
LS.LT_FLAGS[MOHO.LT_IMAGE] = 8; LS.LT_FLAGS["IMAGE"] = 8; LS.LT_FLAGS[-MOHO.LT_IMAGE] = "IMAGE" -- 2
LS.LT_FLAGS[MOHO.LT_GROUP] = 16; LS.LT_FLAGS["GROUP"] = 16; LS.LT_FLAGS[-MOHO.LT_GROUP] = "GROUP" -- 3
LS.LT_FLAGS[MOHO.LT_BONE] = 32; LS.LT_FLAGS["BONE"] = 32; LS.LT_FLAGS[-MOHO.LT_BONE] = "BONE" -- 4
LS.LT_FLAGS[MOHO.LT_SWITCH] = 64; LS.LT_FLAGS["SWITCH"] = 64; LS.LT_FLAGS[-MOHO.LT_SWITCH] = "SWITCH" -- 5
LS.LT_FLAGS[MOHO.LT_PARTICLE] = 128; LS.LT_FLAGS["PARTICLE"] = 128; LS.LT_FLAGS[-MOHO.LT_PARTICLE] = "PARTICLE" -- 6
LS.LT_FLAGS[MOHO.LT_NOTE] = 256; LS.LT_FLAGS["NOTE"] = 256; LS.LT_FLAGS[-MOHO.LT_NOTE] = "NOTE" -- 7
LS.LT_FLAGS[MOHO.LT_3D] = 512; LS.LT_FLAGS["3D"] = 512; LS.LT_FLAGS[-MOHO.LT_3D] = "3D" -- 8
LS.LT_FLAGS[MOHO.LT_AUDIO] = 1024; LS.LT_FLAGS["AUDIO"] = 1024; LS.LT_FLAGS[-MOHO.LT_AUDIO] = "AUDIO" -- 9
LS.LT_FLAGS[MOHO.LT_PATCH] = 2048; LS.LT_FLAGS["PATCH"] = 2048; LS.LT_FLAGS[-MOHO.LT_PATCH] = "PATCH" -- 10
LS.LT_FLAGS[MOHO.LT_TEXT] = 4096; LS.LT_FLAGS["TEXT"] = 4096; LS.LT_FLAGS[-MOHO.LT_TEXT] = "TEXT" -- 11
LS.LT_FLAGS[20] = 2097152; LS.LT_FLAGS["ROOT"] = 2097152; LS.LT_FLAGS[-20] = "ROOT" -- 20

-- Layer Categories
LS.LC_DOC = LS.LT_ROOT + LS.LT_UNKNOWN -- For scripts applicant to any root layer type
LS.LC_ANY = LS.LT_UNKNOWN -- For scripts applicant to any/every layer type
LS.LC_MEDIA = MOHO.LT_IMAGE + MOHO.LT_AUDIO -- For scripts applicant to media kind of layers
LS.LC_GROUP = LS.LT_GROUP + LS.LT_BONE + LS.LT_SWITCH + LS.LT_PARTICLE -- For scripts applicant to group kind of layers
LS.LC_SKEL = MOHO.LT_BONE + MOHO.LT_SWITCH -- For scripts applicant to bone/skel kind of layers
LS.LC_TEXT = LS.LT_NOTE + LS.LT_TEXT -- For scripts applicant to text kind of layers

-- Layer Placement/Placing?
LS.LP_UNKNOWN = 0 -- free (creates above current)
LS.LP_ROOT = 1 -- root only
LS.LP_ROOT_TOP = 2 -- root only at top
LS.LP_ROOT_BOTTOM = 3 -- root only at bottom
LS.LP_GROUP = 3 -- inside group only
LS.LP_GROUP_TOP = 4 -- inside group only at top
LS.LP_GROUP_BOTTOM = 5 -- inside group only at bottom

-- Layer Flags
LS.LF_ROOT = 2
LS.LF_CHILD = 4

-- Script Types
LS.ST_UNKNOWN = 0
LS.ST_TOOL = 1
LS.ST_MENU = 2
LS.ST_EMBED = 3
--LS.ST_S = 4
LS.ST_MODULE = 5
LS.ST_UTILITY = 6

-- Script Inventory Types
LS.SIT_UNKNOWN = 0
LS.SIT_LAYER = 1
LS.SIT_DOCUMENT = 2

-- Script Source Types
LS.SST_UNKNOWN = 0
LS.SST_INSTALLED = 1
LS.SST_LOCAL = 2
LS.SST_REMOTE = 3

-- Label Colors
LS.LC_GRAY = "#838383"
LS.LC_RED = "#DC4040"
LS.LC_ORANGE = "#F0A000"
LS.LC_YELLOW = "#F0F000"
LS.LC_GREEN = "#40DC40"
LS.LC_BLUE = "#4040DC"
LS.LC_PURPLE = "#C060F0"
LS.LC_TAN = "#D2B48C"
LS.LC_PINK = "#FFC0CB"
LS.LC_TURQUOISE = "#40E0D0"
LS.LC_CADETBLUE = "#5F9EA0"
LS.LC_CORAL = "#FF7F50"
LS.LC = {[0] = LS.LC_GRAY, LS.LC_RED, LS.LC_ORANGE, LS.LC_YELLOW, LS.LC_GREEN, LS.LC_BLUE, LS.LC_PURPLE, LS.LC_TAN, LS.LC_PINK, LS.LC_TURQUOISE, LS.LC_CADETBLUE, LS.LC_CORAL}

----------------------------------------------------------------------------------------------------------
LS.Globals = LS.Globals or {fName = "LS_Globals"} -- Globals Submodule
----------------------------------------------------------------------------------------------------------

LS.Globals.Moho = nil
LS.Globals.UserModulesDir = LS.Globals.UserModulesDir or debug.getinfo(1).source:sub(2, -#debug.getinfo(1, "S").source:match("[^/\\]*.lua$") - 1) or "\\Scripts\\Modules"

-- LS Module's Methods:

function LS.AddMethods(target, source, prefix) --(tbl, tbl, str)
	prefix = prefix or ""
	if type(target) == "table" and type(source) == "table" then
		if source then
			for k, v in pairs(source) do
				if type(v) == "function" and not target[k] and not k:match("^__") then --20230811-1346: Avoid metamethod overwriting!
					target[prefix .. k] = v --print(k, v) -- MODE 1 (preferred): add it to target table
					--rawset(target, prefix .. k, v) --print(k, v) -- MODE 2: add it to target table with rawset?
				end
			end
			local metatable = getmetatable(source)
			LS.AddMethods(target, metatable) -- recursion...
		end
	end
end

function LS.BeepBeep(msec) --(int)
	msec = msec or 333
	LM.Beep() LM.Snooze(msec) LM.Beep()
end

function LS.BuildLayerTypeList() --() tbl
	local layerTypeList = {}
	for k, v in pairs(MOHO) do
		local lt = ""
		if k:sub(1, 3) == "LT_" and type(v) == "number" then
			layerTypeList[v] = #k:gsub("LT_", "") > 2 and k:gsub("LT_", ""):lower():gsub("^%l", string.upper) or k:gsub("LT_", "") -- text after LT_ is lowered and 1st char uppered, unless it's shorten than 3 chars
		end
	end
	return layerTypeList
end

function LS.ClickClick(msec) --(int)
	msec = msec or 125
	MOHO.ScriptInterface:Click() LM.Snooze(msec) MOHO.ScriptInterface:Click()
end

function LS.DoubleClick(prevState, curState, prevClock, speed, speedFactor) --(any, any, num, num) bool
	speed, speedFactor = speed or 300, speedFactor or 1
	if prevState ~= nil and prevState ~= curState then
		if prevClock and (os.clock() - prevClock) * 1000 < speed * (speedFactor or 1) then
			--print("Double Click!!!")
			return true
		end
		--self.prevClock = os.clock()
	end
	return false
end

function LS.RunningAs(f) --(int) int, str
	f = f or 2
	local kind = 0
	local runner = debug.getinfo(f, "n").name --print(tostring(runAsLayerScript)) --print(tostring(caller))
	if runner == "Run" then
		kind = LS.ST_EMBED --3
	else
		kind = LS.ST_MENU --2
	end
	return kind, runner
end

function LS.Localize(s, n) --(str, int)
	local lang = ({["New"]="EN", ["Neu"]="DE", ["Nuevo"]="ES", ["Nouveau"]="FR", ["新規"]="JA", ["Новый"]="RU", ["新建项目"]="ZH_CN", ["新建"]="ZH_HK"})[MOHO.Localize("/Menus/File/New=New")] --EN = English, DE = Deutsch, ES = Español, FR = Français, JA = Japanese, RU = Russian, ZH_CN = Chinese (PRC), ZH_HK = Chinese (Hong Kong)
	if (lang == nil) then
		return s
	end

	local path = self:Location(1, 2) .. "_" .. lang .. ".txt"
	if (path == nil) or (path == "") then
		return s
	end

	local f = io.open(path, "r")
	if (f == nil) then
		return s
	end

	local escapes = {a = '\a', b = '\b', f = '\b', n = '\n', r = '\r', t = '\t', v = '\v', ['\\'] = '\\', ["'"] = "'", ['"'] = '"'}
	local c, n = 1, n or 1
	local k, v = "", ""
	local cmd = f:read()
	s = s:gsub('"', '\\"') --WIP!

	--print(lang, ", ", type(self.strings), ", ", self.strings[s])
	if self.strings ~= nil and self.strings[s] ~= nil and cmd:sub(1,3) ~= "WIP" then
		return assert(load(('return "%s"'):format(self.strings[s])))() --.. "(In Table)"
	end
	while (cmd ~= nil) do
		if cmd ~= "" then
			k, v = cmd, f:read() --print(k, " || ", v)
			--if s:find("Ignore") then print(s, " || ", k, " || ", v) end
			while v ~= nil and v ~= "" do
				if s == k and c == n then --print(k, " || ", v)
					self.strings[k] = tostring(v)
					s = assert(load(('return "%s"'):format(v)))() --s = tostring(v)
					break
					--return tostring(v)
				end
				v = f:read()
				c = c + 1
			end
		end
		cmd = f:read()
		c = 1
	end
	f:close()

	return s
end

--[[
function LS.Localize(s)
	local lang = "EN" --0 = EN, 1 = ES, 2 = DE
	local tools = MOHO.Localize("/Windows/Tools/Title=Tools") --determine current language
	if tools == "Herramientas" then
		lang = "ES"
	elseif tools == "Werkzeuge" then
		lang = "DE"
	end
	--print(lang, type(self[lang]), self[lang][s])
	if self[lang] ~= nil and self[lang][s] ~= nil then
		s = self[lang][s]
	end
	return s
end
--]]

function LS.P1(frame, sep, ...) --(int, str, ...)
	local s = ""
	local sep = sep or ", "
	local arg = {...}
	if (self.frame ~= nil and frame ~= nil) and self.frame ~= frame then
		for i, v in ipairs(arg) do
			s = s .. tostring(v) .. (i ~= #arg and sep or "") --"\t"
		end
		print(s)
	end 
	--self.frame = moho.frame 
end

----------------------------------------------------------------------------------------------------------
LS.MohoDoc = LS.MohoDoc or {} -- MohoDoc Submodule
----------------------------------------------------------------------------------------------------------

-- MohoDoc Submodule attributes:
LS.MohoDoc.curLayer = 0

function LS.MohoDoc:GetCurLayer() --MohoLayer
	local curLayer = nil
	local selLayers = {}
	local selCount = self:CountSelectedLayers()

	if selCount > 1 then
		for i = 0, selCount - 1 do --storing current multi-selection
			local layer = self:GetSelectedLayer(i)
			table.insert(selLayers, layer)
		end

		self:ClearSecondarySelection() --clearing current multi-selection
		self:CountSelectedLayers() --THIS DUMMY LINE SEEMS TO MAKE IT WORK FOR WHATEVER REASON...
		curLayer = self:GetSelectedLayer(0) --getting the working layer now that it's the only one selected

		for i = 1, #selLayers do --restoring the previous multi-selection
			local layer = selLayers[i]
			layer:SetSecondarySelection(true)
		end
	elseif selCount == 1 then
		curLayer = self:GetSelectedLayer(0)
	else
		--self:Refresh()
		if self.curLayer ~= nil then
			curLayer = self.curLayer
		else
			return
		end
	end

	return curLayer
end

function LS.MohoDoc:CountAllLayers(doc) --(MohoDoc) int 
	self = doc or self
	if self ~= nil then
		local count = 0
		repeat
			local layer = self:LayerByAbsoluteID(count)
			if layer then
				count = count + 1
			end
		until not layer
		return count
	end
end

function LS.MohoDoc:ListLayers() --tbl
	if self ~= nil then
		local t = {}
		local count = 0
		repeat
			local layer = self:LayerByAbsoluteID(count)
			if layer then
				table.insert(t, layer:Name()) --t[count] = layer:Name()
				count = count + 1
			end
		until not layer
		return t
	end
end

function LS.MohoDoc:Main2Action(prevAction, invert) --(str) bool
	self = doc or self if self == nil then return end
	prevAction = prevAction or ""
	invert = invert or false --invert == nil and false or invert (NOT necessary here!)
	local docAction = self:CurrentDocAction()

	if (invert and docAction == "") or (not invert and docAction ~= "") then --2023053-0005(ORIG): if docAction ~= "" then
		if prevAction and (prevAction == "" and docAction ~= "") or prevAction ~= docAction then --print(prevAction, ", ", docAction .. "!!!")
			return true
		end
	end
	return false
end

function LS.MohoDoc:ScanDoc(reverse, indent) --(int, int) tbl
	reverse = reverse or 1
	indent = indent or 0
	t = {}

	for r = reverse == 1 and 0 or self:CountLayers() - 1, reverse == 1 and self:CountLayers() - 1 or 0, reverse == 1 and 1 or -1 do
		local layer, group = self:Layer(r)
		table.insert(t, {["layer"] = layer, ["AID"] = self:LayerAbsoluteID(layer), ["name"] = layer:Name(), ["indent"] = 0})
		if layer:IsGroupType() then
			group = MOHO.ScriptInterface:LayerAsGroup(layer)
			t[#t].isExpanded = group:IsExpanded()
			LS.MohoLayer:ScanGroup(layer, t, reverse, indent)
		end
	end
	return t
end

----------------------------------------------------------------------------------------------------------
LS.ColorOps = LS.ColorOps or {} -- Color Operations Submodule
----------------------------------------------------------------------------------------------------------

function LS.ColorOps:SetRgb(curRgb, newRgb) --(tbl, tbl)
	curRgb.r = curRgb.r and newRgb.r or 0
	curRgb.g = curRgb.g and newRgb.g or 0
	curRgb.b = curRgb.b and newRgb.b or 0
	curRgb.a = curRgb.a and newRgb.a or 0
	return curRgb
end

function LS.ColorOps:Hex2Model(hex, model) --(str, str)
	hex = (hex and type(hex) == "string") and hex:gsub("#","") or "000000"
	model = (model and type(model) == "string") and model:lower() or "rgb"

	local color = #hex == 6 and {r = tonumber("0x" .. hex:sub(1, 2)), g = tonumber("0x" .. hex:sub(3, 4)), b = tonumber("0x" .. hex:sub(5, 6))} or {r = tonumber("0x" .. hex:sub(1, 1)) * 17, g = tonumber("0x" .. hex:sub(2, 2)) * 17, b = tonumber("0x" .. hex:sub(3, 3)) * 17}
	if model == "rgb" then
		color = LM.ColorOps:RgbColor(color.r, color.g, color.b)
	elseif model == "hsv" then
		color = LM.ColorOps:HsvColor(color.r, color.g, color.b)
	elseif model == "v" or model == "vec" or model == "vector" then
		local cv = LM.ColorVector:new_local() cv:Set(color.r / 255, color.g / 255, color.b / 255)
		color = cv
	end
	return color
end --print(LS.ColorOps:Hex2Model("#FF00FF", "hsv").h, ", ", LS.ColorOps:Hex2Model("#FF00FF", "hsv").s, ", ", LS.ColorOps:Hex2Model("#FF00FF", "hsv").v)

----------------------------------------------------------------------------------------------------------
LS.OS = LS.OS or {} -- OS/Sys Submodule
----------------------------------------------------------------------------------------------------------

function LS.OS:FileExists(path) --(str) bool NOTE: win only??
	local f = io.open(path, "r")
	return f ~= nil and io.close(f)
end

function LS.OS:GetOS() --str
	return package.config:sub(1, 1) == "\\" and "win" or "unix"
end

function LS.OS:Open(location) --(str) void
	if LS.OS:GetOS() == "unix" then
		os.execute('open "" "' .. location .. '"')
	else
		os.execute('start "" "' .. location .. '"')
	end
end

function LS.OS:ResourceExists(folder, keyword, kind) --(str, str, str ext) bool, str
	folder = folder or ""
	local resDir =  MOHO.MohoGlobals.UserResourcesDir and MOHO.MohoGlobals.UserResourcesDir .. "\\" .. folder or ""
	if lfs and lfs.chdir(resDir) then
		for filename in lfs.dir(resDir) do
			if kind then
				if filename:lower():match("%." .. kind:lower() .. "$") then
					local st, en, fileMatch = filename:find("^(" .. keyword .. ")")
					if fileMatch then
						return true, filename
					end
				end
			else
				local st, en, fileMatch = filename:find("^(" .. keyword .. ")")
				if fileMatch then
					return true, filename
				end
			end
		end
	end
	return false
end --print(tostring(LS.OS:ResourceExists(_G.LS_PointLinker:Location(2), "icon", "lua")))

function LS.OS:ResourceListing(folder) --(tbl) tbl
	folder = folder or ""
	local resDir =  MOHO.MohoGlobals.UserResourcesDir and MOHO.MohoGlobals.UserResourcesDir .. "\\" .. folder or ""
	local resDirList = {}
	if lfs and resDir and lfs.chdir(resDir) then
		for filename in lfs.dir(resDir) do
			if filename ~= "." and filename ~= ".." then
				table.insert(resDirList, filename)
			end
		end
	end
	return #resDirList > 0 and resDirList or nil
end

function LS.OS:ScriptDir(part) --(int) str | https://stackoverflow.com/a/74661335/2805176
	part = (part and (type(part)) == "number") and part or 1
	local dir = debug.getinfo(2, "S").source:sub(2)
	return dir:match("(.*[/\\])") .. (part > 1 and debug.getinfo(2, "S").source:sub(2):match("[^/\\]*.lua$"):sub(0, -5) or "") .. (part > 2 and ".lua" or "") or "./"
end

function LS.OS:SuitPath(path) --(str) str
	return package.config:sub(1, 1) == "\\" and path:gsub("/", "\\") or path:gsub("\\", "/")
end

----------------------------------------------------------------------------------------------------------
LS.Data = LS.Data or {} -- Data Submodule
----------------------------------------------------------------------------------------------------------

function LS.Data:TableClone(t)
	return {table.unpack(t)}
end

function LS.Data:TableComparison(t1, t2)
	if #t1 ~= #t2 then
		return false
	end
	for i = 1, #t1 do
		if t1[i] ~= t2[i] then
			return false
		end
	end
	return true
end

function LS.Data:TableConcat(t, fSep, kSep) --(tbl, str, str)
	local cTab, n, fSep, kSep = {}, 1, fSep or "", kSep or ": "
	for k, v in pairs(t) do
		if not ({["function"] = 0, table = 0, thread = 0, userdata = 0})[type(v)] then
			cTab[n] = k .. kSep .. tostring(v)
			n = n + 1
		end
	end
	return table.concat(cTab, fSep)
end --print(LS.Data:TableConcat({"ONE", "TWO", "THREE", ["One"] = "1", ["Two"] = "2", ["Three"] = "3"}, " | "))

function LS.Data:CountKeys(t, kind, s)
	local count = 0
	for k in pairs(t) do 
		if kind ~= nil and type(k) == kind then --count only specified type of keys
			if s ~= nil and k == "string" then
				count = k:match(s) and count + 1 or count
			else
				count = count + 1
			end
		elseif not type(k) == "number" and (k > 0 and math.floor(k) == k) then --count all but positive integers
			count = count + 1
		end
	end
	return count
end

function LS.Data:UUID(short) --(bool) str --20221209-1700: https://gist.github.com/jrus/3197011
	short = short == nil and false or short
	local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
	math.randomseed(os.time() + math.floor(10000*math.random()))
	local uuid = (string.gsub(template, "[xy]", function (c)
		local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
		return string.format("%x", v)
	end))
  
	return short and uuid:sub(1, 8) or uuid
end

function LS.Data:UUIDAlt()
	local tempLayer = MOHO.MohoLayer:new_local()
	return tempLayer:UUID()
end

----------------------------------------------------------------------------------------------------------
LS.String = LS.String or {} -- String Submodule
----------------------------------------------------------------------------------------------------------

function LS.String:Centring(s, d, widgetWidth, margin, shift, char) --(str, dlog, int, int, int, str) str
	widgetWidth, margin, shift, char = widgetWidth or 256, margin or 24, shift or 0, char or " "
	local sWidth = 0
	if (s ~= nil and d ~= nil) then
		d.dummyText = LM.GUI.DynamicText(s, 0)
		sWidth = d.dummyText:Width()
	else
		return s
	end
	s = shift < 0 and s .. (char):rep(shift) or (char):rep(shift) .. s
	while sWidth < widgetWidth - margin do
		s = char .. s .. char
		d.dummyText = LM.GUI.DynamicText(s, 0) --d.dummyText:SetValue(s)
		sWidth = d.dummyText:Width() --print(sWidth)
	end
	return s
end

function LS.String:Compact(s, lenght, from, mark) --(str, int, real, str) str
	if s and length or #s > lenght then
		from, mark = from or 0.5, mark or "…" -- "…" "..." " […] " "~" " | " "||"
		if from <= 0 then -- 0: "...from left."
			s = s:sub(-lenght)
			s = (s:sub(1, 1) == " " and mark .. s:sub(2, #s) or mark .. s) -- remove possible space
		elseif from >= 1 then -- 1: "From right..."
			s = s:sub(1, lenght)
			s = (s:sub(-1) == " " and s:sub(1, -2) .. mark or s .. mark) -- remove possible space
		else  -- 0.5/nil: "From...center", or >0.0/<1.0 to shift (Warning: emojis may affect extreme shititng results!)
			s = s:sub(1, math.ceil(lenght * from)) .. mark .. s:sub(math.floor(-lenght * (1 - from))) -- remove possible space PENDING!
		end
	end
	return s
end

function LS.String:Decentring(s, d, shift, off, char) --(str, dlog, int, int, str) str
	s, off, char = s or "", off or 0, char or " "
	local sTail, sTailWidth = "", 0
	while sTailWidth < math.abs(shift) + off do --the offset is for compensating e. g. the space taken by menu widgets' right arrow
		sTail = shift < 0 and sTail .. char or char .. sTail
		d.dummyText = LM.GUI.DynamicText(sTail, 0) --d.dummyText:SetValue(s)
		sTailWidth = d.dummyText:Width() - off
	end --print(sTailWidth)
	return shift < 0 and s .. sTail or sTail .. s --(s .. sTail):gsub('()',{[math.ceil(#(s .. sTail)/2)]="◧"}) --middle char test
end

function LS.String:MultiLiner(s, width, sep, remove) --(dlog, str, int, bool) tbl --20221009-1330: http://www.wellho.net/resources/ex.php?item=u108/patplode
	sep = sep or "%S+"
	remove = remove == nil and true or remove
	local w = LM.GUI.StaticText
	local t = {words = {}, lines = {}}
	local lineCount = 1
	local charCount = 0
	for i in string.gmatch(s, sep) do
		table.insert(t.words, i) --t.words[wordCount] = i
		charCount = #table.concat(t.lines, " ") + #table.concat(t.words, " ") + 1 --print(#s, ", ", charCount)
		local lineWidth = LM.GUI.DynamicText(table.concat(t.words, " "), 0):Width() --print("Width: " .. d.lineWidth:Width())
		if lineWidth > width or charCount >= #s then
			t.lines[lineCount] = table.concat(t.words, " ")
			t.words = {}
			lineCount = lineCount + 1
		end
	end
	return t.lines
end

function LS.String:MultiText(d, s, sep, width, remove) --(dlog, str, int, bool) tbl --20221009-1330: http://www.wellho.net/resources/ex.php?item=u108/patplode
	sep = sep or "%S+"
	remove = remove == nil and true or remove
	local t = {words = {}, lines = {}}
	local lineCount = 1
	local charCount = 0
	for i in string.gmatch(s, sep) do
		table.insert(t.words, i) --t.words[wordCount] = i
		charCount = #table.concat(t.lines, " ") + #table.concat(t.words, " ") + 1 --print(#s, ", ", charCount)
		d.lineWidth = LM.GUI.DynamicText(table.concat(t.words, " "), 0) --print("Width: " .. d.lineWidth:Width())
		if d.lineWidth:Width() > width or charCount >= #s then
			t.lines[lineCount] = table.concat(t.words, " ")
			t.words = {}
			lineCount = lineCount + 1
		end
	end
	return t.lines
end

function LS.String:Replace(substring, replacement, n) -- Plain replacement (all characters are non-magic) [https://stackoverflow.com/a/76013512/2805176]
	return (self:gsub(substring:gsub("%p", "%%%0"), replacement:gsub("%%", "%%%%"), n))
end

function LS.String:SplitPath(path, n, alt) -- 1 .. 2 .. 3 == fullPath (alt == true -> 1: no last \/, 2: name + extension,3: no dot)
	return (string.gsub(path, alt and "^(.-)[\\/]([^\\/]-%.([^\\/%.]-))%.?$" or "^(.-)([^\\/]-)(%.[^\\/%.]-)%.?$", "%" .. (n or 1))) -- "^(.-)([^\\/]-%.([^\\/%.]-))%.?$" (filename with extension) -- "^(.-)([^\\/]-)%.([^\\/%.]-)%.?$", "%" (exclude dot) -- string.match(path, "^(.-)([^\\/]-)(%.[^\\/%.]-)%.?$") (return 3 values version)
end

function LS.String:String2KeyValue(s, sep) --(str, str) tbl
	sep = sep or ":" --"%s"
	local t = {}
	for line in s:gmatch("(.-)\r?\n") do --for line in str:gmatch"[^\n]+" do
		local k, v = line:match("%s*([^" .. sep  .. "]+)%s*" .. sep .. "%s*(.-)%s*$") --local k, v = line:match("^(.-)" .. sep .. "(.-)$") --print(k, ", ", v)
		if not k then -- line is not k:v pair, so add to array
			table.insert(t, line)
		else --line is k:v pair, so add to dict
			t[k] = v
		end
	end
	return t
end

function LS.String:StringToKeyValue(s, sep) --(str, str) tbl
	sep = sep or ":" --"%s"
	local t = {}
	for line in (s.."\n"):gmatch"(.-)\r?\n" do
		for k, v in line:gmatch("([^:]+)" .. sep .. "([^:\n\r]+)") do --print(k, ", ", v)
			if not k then -- line is not k:v pair, so add to array
				table.insert(t, line)
			else --line is k:v pair, so add to dict
				t[k] = v
			end
		end
	end
	return t
end

function LS.String:UnCamel(s) --(str) str
	s = s or self
	if type(s) == "string" then
		local result = string.gsub(s, "%u", " %1"):gsub("(%d+)", " %1")
		return (result:gsub("^%s*(.-)%s*$", "%1"))
	else
		return tostring(s)
	end
end

function LS.String:Acronymize(s, ignore) --(str, tbl) str | https://stackoverflow.com/a/47053374/2805176
	s = s or self
	local ignored = {['a'] = true, ['an'] = true, ['and'] = true, ['in'] = true, ['for'] = true, ['of'] = true, ['the'] = true, ['to'] = true, ['or'] = true} -- default list of words to ignore
	if ignore and type(ignore) == "table" then
		for word in pairs(ignore) do
			ignored[word] = ignore[word]
		end
	elseif ignore == false then
		ignored = {}
	end
	
	local words, ans = LS.String:UnCamel(s), {}
	for w in words:gmatch "[%w\']+" do
		if not ignored[w:lower()] or ignored[w:lower()] == false then
			ans[#ans + 1] = w:sub(1, 1):upper()
		end
	end
	return table.concat(ans)
end

-----------------------------------------------------
-- The Script class constructor
-----------------------------------------------------
--[[20230510-0430: First method...
setmetatable(string, {
	__index = function(t, k)
		if k == "UnCamel" then
			return LS.String.UnCamel
		else
			return rawget(t, k)
		end
	end
})
--]]
--[[20230510-0620: Second method...
for k,v in pairs(LS.String) do -- add methods to the string library as is
	rawset(string, k, v)
end
--]]
for k, v in pairs(LS.String) do -- add methods to the string library with a prefix
	local newName = "LS_" .. k
	LS.String[newName] = v
	rawset(string, newName, v)
end

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
LS.GUI = LS.GUI or {} -- Module LS.GUI
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

LS.GUI.MSG = MOHO.MSG_BASE

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
LS.M = LS.M or {} -- Module (M = Moho/Module/Main)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

--[[
-- Script Types
LS.M.ST_UNKNOWN = 0
LS.M.ST_TOOL = 1
LS.M.ST_MENU = 2
LS.M.ST_EMBED = 3
LS.M.ST_S = 4

-- Script Inventory Types
LS.M.SIT_UNKNOWN = 0
LS.M.SIT_LAYER = 1
LS.M.SIT_DOCUMENT = 2

-- Script Source Types
LS.M.SST_UNKNOWN = 0
LS.M.SST_INSTALLED = 3
LS.M.SST_LOCAL = 4
LS.M.SST_REMOTE = 5

-- Other Properties
LS.M.UserAppDir = LS.M.UserAppDir or debug.getinfo(1, "S").source:sub(2):match("(.*)[/\\]"):match("(.*)[/\\]"):match("(.*)[/\\]") or "\\Scripts\\ScriptResources" --print(LS.M.UserAppDir or "NIL")
LS.M.UserScriptRes = LS.M.UserAppDir ~= nil and LS.M.UserAppDir .. "\\Scripts\\ScriptResources" or "\\ScriptResources" --print(LS.M.UserScriptRes or "NIL")
LS.M.UserScriptMod = MOHO.ScriptInterface ~= nil and MOHO.ScriptInterface:UserAppDir() .. "\\Scripts\\Modules" or "\\Modules" --print(LS.M.UserScriptMod or "NIL")
--]]

return LS