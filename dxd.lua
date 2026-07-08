-- https://lua.expert/
task.wait()

local function new(p1, p2) --[[ new | Line: 7 ]]
	return function(p13) --[[ Line: 8 | Upvalues: p1 (copy), p2 (copy) ]]
		local v1 = Instance.new(p1)

		for v2, v3 in p13 do
			if type(v2) == "number" then
				v3.Parent = v1

				continue
			end

			v1[v2] = v3
		end

		v1.Parent = v1.Parent or p2

		return v1
	end
end

local function v1(p1, p2, p3, p4, p5) --[[ Line: 22 | Upvalues: v1 (ref) ]]
	local ok, result = pcall(function() --[[ Line: 23 | Upvalues: p1 (copy), p2 (copy) ]]
		return p1[p2]
	end)

	if ok then
		return result
	end

	if not p3 then
		return nil
	end

	for v12, v2 in p1:GetChildren() do
		local v3 = v1(v2, p2, true)

		if v3 then
			return v3
		end
	end

	return nil
end

local function WaitForChild(p1, p2, p3) --[[ WaitForChild | Line: 39 | Upvalues: v1 (ref) ]]
	local v12

	repeat
		v12 = v1(p1, p2)
		task.wait()
	until v12

	return v12
end

local function wrap(p1, ...) --[[ wrap | Line: 46 ]]
	local v1, v2 = coroutine.resume(coroutine.create(p1), ...)

	if not v1 then
		warn((("Kohl\'s Admin Infinite Error: %* \n %*"):format(v2, (debug.traceback()))))
	end

	return v1, v2
end

local function S(p1) --[[ S | Line: 53 ]]
	return game:GetService(p1)
end

local t = {
	Teams = game:GetService("Teams"),
	Debris = game:GetService("Debris"),
	Content = game:GetService("ContentProvider"),
	Gui = game:GetService("GuiService"),
	Group = game:GetService("GroupService"),
	Market = game:GetService("MarketplaceService"),
	UIS = game:GetService("UserInputService"),
	TP = game:GetService("TeleportService"),
	Collection = game:GetService("CollectionService"),
	Players = game:GetService("Players"),
	Lighting = game:GetService("Lighting"),
	Badge = game:GetService("BadgeService"),
	Run = game:GetService("RunService"),
	RStorage = game:GetService("ReplicatedStorage"),
	Insert = game:GetService("InsertService"),
	SS = game:GetService("SoundService"),
	HTTP = game:GetService("HttpService"),
	StarterGui = game:GetService("StarterGui"),
	StarterPack = game:GetService("StarterPack"),
	StarterPlayer = game:GetService("StarterPlayer"),
	User = game:GetService("UserService")
}
local LocalPlayer = game.Players.LocalPlayer
local t2 = {
	ColorTransparency = 0.8,
	AdminCredit = true,
	AutoCleanDelay = 30,
	CommandBar = true,
	FunCommands = true,
	Prefix = ":",
	ForcedColor = false,
	Color = Color3.new(),
	GroupAdmin = {},
	VIPAdmin = {}
}
local v2 = "ImageTransparency"
local v3 = "TextTransparency"
local v4 = "TextStrokeTransparency"
local v5 = "BackgroundTransparency"
local v6 = "AbsolutePosition"
local v7 = "AbsoluteSize"
local t3 = {}
local v8 = "UserInputType"
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}

for v9, v10 in { 313101943, 305266753, 305291549, 305807605, 305807572, 305807549, 313321271, 306774746 } do
	t.Content:Preload("rbxassetid://" .. v10)
end

repeat
	task.wait()
until LocalPlayer:GetMouse() and (workspace.CurrentCamera and (v1(LocalPlayer, "PlayerGui") and v1(LocalPlayer, "KDonor")))

local CurrentCamera = workspace.CurrentCamera
local v11 = LocalPlayer:GetMouse()
local Character = LocalPlayer.Character
local PlayerGui = LocalPlayer.PlayerGui
local KDonor = LocalPlayer.KDonor
local v12 = WaitForChild(t.RStorage, "b\7\n\7\n\7")
local t9 = {
	uID = "",
	s = script,
	template = require(script:WaitForChild("Templates"))
}
local v13 = v1(v12, "\7dmi\n")
local v14 = v1(v12, "\8\7\n")
local v15 = v1(v12, "log")
local v16 = v1(v12, "clog")
local v17 = "ScreenGui"
local v18 = nil

local function f19(p13) --[[ Line: 8 | Upvalues: v17 (copy), v18 (copy) ]]
	local v1 = Instance.new(v17)

	for v2, v3 in p13 do
		if type(v2) == "number" then
			v3.Parent = v1

			continue
		end

		v1[v2] = v3
	end

	v1.Parent = v1.Parent or v18

	return v1
end

local v20 = f19({
	Name = "KCoreUI",
	IgnoreGuiInset = true,
	ResetOnSpawn = false,
	Parent = PlayerGui
})

function t9.unMapTab(p1, p2) --[[ unMapTab | Line: 121 | Upvalues: t9 (copy) ]]
	local t = {}

	for v1, v2 in p1 do
		if type(v2) == "table" then
			t[tostring(v1)] = t9.unMapTab(v2)

			continue
		end

		t[tonumber(v1)] = v2
	end

	return t
end
function t9.AssetInfo(p1) --[[ AssetInfo | Line: 132 | Upvalues: t (copy) ]]
	return t.Market:GetProductInfoAsync(p1)
end
function t9.RImage(p1, p2, p3) --[[ RImage | Line: 135 | Upvalues: t9 (copy) ]]
	local v1 = t9.AssetInfo(p1)

	if v1.AssetTypeId == 1 then
		return p1
	end

	local Id = v1.Creator.Id
	local count = p1

	repeat
		count = count - 1
	until t9.AssetInfo(p1).Creator.Id == Id or p1 - count > 10

	return count
end
function t9.unCache(p1, p2, p3, p4) --[[ unCache | Line: 146 ]]
	local t = {}

	for v1 in p1:gmatch("%S+") do
		local v2, v3 = v1:match("(.+):(.+)")

		t[tonumber(v2)] = tonumber(v3)
	end

	return t
end
function t9.Merge(p1, p2) --[[ Merge | Line: 154 ]]
	for v1, v2 in p2 do
		p1[v1] = v2
	end

	return p1
end
function t9.UpdateAdmins() --[[ UpdateAdmins | Line: 160 | Upvalues: t4 (ref), t9 (copy), v13 (ref) ]]
	t4 = t9.unCache(v13.Value)
end
function t9.Stroke(p1) --[[ Stroke | Line: 163 ]]
	return math.max(p1.r, p1.g) > 0.5 and Color3.new() or Color3.new(255/255, 255/255, 255/255)
end
function t9.Hide(p1, p2, p3, p4) --[[ Hide | Line: 166 | Upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v1 (ref) ]]
	local v12 = p3 or 0.2

	if not p4 then
		p4 = {}

		local function v22(p1, p2) --[[ Line: 171 | Upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v1 (ref), p4 (ref), v22 (ref) ]]
			local t = {}

			for v12, v23 in { v2, v3, v4, v5 } do
				if v1(p1, v23) and p1[v23] ~= 1 then
					t[v23] = { p1[v23], 1 - p1[v23] }
				end
			end

			p4[#p4 + 1] = { p1, t }

			for v32, v42 in p1:GetChildren() do
				v22(v42)
			end
		end

		v22(p1)
		p1.Visible = true
	end

	if v12 ~= 0 then
		local v32 = tick()
		local v42 = 1 / v12

		repeat
			local v52 = (tick() - v32) * v42

			for v6, v7 in p4 do
				for v8, v9 in v7[2] do
					v7[1][v8] = v9[1] + v9[2] * v52
				end
			end

			task.wait()
		until v52 >= 1
	end

	p1.Visible = false

	if p2 then
		p1:Destroy()
	else
		for v10, v11 in p4 do
			for v122, v13 in v11[2] do
				v11[1][v122] = v13[1]
			end
		end
	end
end
function t9.Show(p1, p2, p3) --[[ Show | Line: 210 | Upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v1 (ref) ]]
	local v12 = p2 or 0.2

	if not p3 then
		p3 = {}

		local function v22(p1, p2) --[[ Line: 215 | Upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v1 (ref), p3 (ref), v22 (ref) ]]
			local t = {}

			for v12, v23 in { v2, v3, v4, v5 } do
				if v1(p1, v23) and p1[v23] ~= 1 then
					t[v23] = { p1[v23], 1 - p1[v23] }
					p1[v23] = 1
				end
			end

			p3[#p3 + 1] = { p1, t }

			for v32, v42 in p1:GetChildren() do
				v22(v42)
			end
		end

		v22(p1)
		p1.Visible = true
	end

	if v12 ~= 0 then
		local v32 = tick()
		local v42 = 1 / v12

		repeat
			local v52 = 1 - (tick() - v32) * v42

			for v6, v7 in p3 do
				for v8, v9 in v7[2] do
					v7[1][v8] = v9[1] + v9[2] * v52
				end
			end

			task.wait()
		until v52 <= 0
	end

	for v10, v11 in p3 do
		for v122, v13 in v11[2] do
			v11[1][v122] = v13[1]
		end
	end
end
function t9.Drag(p1, p2, p3, p4, p5, p6, p7) --[[ Drag | Line: 250 | Upvalues: v8 (ref), v6 (ref), v11 (ref), t (copy), v7 (ref), v20 (copy) ]]
	local v1 = p1.Parent

	p1.InputBegan:connect(function(p12) --[[ Line: 252 | Upvalues: v8 (ref), p1 (copy), v6 (ref), v11 (ref), t (ref), p4 (ref), p7 (ref), v1 (ref), p6 (ref), p2 (copy), p3 (copy), v7 (ref), v20 (ref) ]]
		if p12[v8] ~= Enum[v8].MouseButton1 and p12[v8] ~= Enum[v8].Touch then
			return
		end

		local v12 = Vector2.new(p1[v6].X - v11.X, p1[v6].Y - (v11.Y - t.Gui.TopbarInset.Height))

		p4 = v12
		p7 = t.UIS.InputEnded:connect(function(p1) --[[ Line: 256 | Upvalues: v8 (ref), p4 (ref) ]]
			if p1[v8] ~= Enum[v8].MouseButton1 and p1[v8] ~= Enum[v8].Touch then
				return
			end

			p4 = nil
		end)

		while p4 == v12 and (p1 and p1.Parent == v1) do
			p6 = p2 and p3 and Vector2.new(p2, p3) or Vector2.new(p1[v7].X, p1[v7].Y)
			p1.Position = UDim2.new(0, math.clamp(v11.X + p4.x, 0, v20.AbsoluteSize.X - p6.x), 0, (math.clamp(v11.Y + p4.y, 0, v20.AbsoluteSize.Y - p6.y)))
			task.wait()
		end

		p7:disconnect()
	end)
end
function t9.Resize(p1, p2, p3, p4, p5, p6, p7) --[[ Resize | Line: 275 | Upvalues: t9 (copy), v8 (ref), v11 (ref), t (copy) ]]
	local v1 = p1.Parent
	local v2 = t9.template.Resize:Clone()

	v2.Parent = p1
	v2.InputBegan:connect(function(p12) --[[ Line: 279 | Upvalues: v8 (ref), v11 (ref), p1 (copy), p7 (ref), p6 (ref), t (ref), v1 (ref), p2 (copy), p3 (copy) ]]
		if p12[v8] ~= Enum[v8].MouseButton1 and p12[v8] ~= Enum[v8].Touch then
			return
		end

		local t2 = {
			x = v11.X,
			y = v11.Y,
			s = p1.AbsoluteSize,
			m = Vector2.new(v11.ViewSizeX - p1.AbsolutePosition.X, v11.ViewSizeY - p1.AbsolutePosition.Y)
		}

		p7 = t2
		p6 = t.UIS.InputEnded:connect(function(p1) --[[ Line: 288 | Upvalues: v8 (ref), p7 (ref) ]]
			if p1[v8] ~= Enum[v8].MouseButton1 and p1[v8] ~= Enum[v8].Touch then
				return
			end

			p7 = nil
		end)

		while p7 == t2 and (p1 and p1.Parent == v1) do
			p1.Size = UDim2.new(0, math.min(p7.m.X, (math.max(p2 or 20, p7.s.X + (v11.X - p7.x)))), 0, (math.min(p7.m.Y, (math.max(p3 or 20, p7.s.Y + (v11.Y - p7.y))))))
			task.wait()
		end

		p6:disconnect()
	end)
end
function t9.UpdateVar() --[[ UpdateVar | Line: 306 | Upvalues: CurrentCamera (ref), LocalPlayer (ref), Character (ref), PlayerGui (ref), WaitForChild (copy), v11 (ref) ]]
	CurrentCamera = CurrentCamera or workspace.CurrentCamera
	LocalPlayer = LocalPlayer or game.Players.LocalPlayer
	Character = LocalPlayer.Character
	PlayerGui = WaitForChild(LocalPlayer, "PlayerGui")
	v11 = v11 or LocalPlayer:GetMouse()
end
function t9.MatchPlr(p1, p2, p3) --[[ MatchPlr | Line: 313 | Upvalues: t (copy) ]]
	local v1 = "^" .. (p1 or ""):lower()
	local v2 = ""

	for v3, v4 in t.Players:GetPlayers() do
		local v5 = v4.Name:lower():match(v1)

		if v5 and #v2 < #v5 then
			v2 = v5
			p3 = v4
		end
	end

	return p3
end
function t9.MatchClr(p1, p2) --[[ MatchClr | Line: 324 ]]
	local v1 = BrickColor.new(p1:sub(1, 1):upper() .. p1:sub(2))

	if v1 == BrickColor.new(0) or not v1 then
		v1 = nil
	end

	local v2

	if v1 then
	else
		for v3, v4 in { "New Yeller", "Pastel Blue", "Dusty Rose", "CGA brown" } do
			if p1:lower():find("^" .. v4) then
				v2 = BrickColor.new(v4)
			end
		end
	end

	if not v2 and p1:find("^random") then
		v2 = BrickColor.Random()
	end

	return if v2 then v2.Color else v2
end
function t9.Has(p1, p2) --[[ Has | Line: 340 | Upvalues: t (copy) ]]
	return t.Market:PlayerOwnsAssetAsync(p1, p2)
end
function t9.onCam(p1) --[[ onCam | Line: 343 | Upvalues: CurrentCamera (ref) ]]
	return (CurrentCamera.CFrame:inverse() * p1).z < 0
end
function t9.PredictCmds(p1, p2) --[[ PredictCmds | Line: 346 | Upvalues: t2 (ref), t3 (ref), t4 (ref), LocalPlayer (ref) ]]
	local v2, v3 = p1:lower():gsub(t2.Prefix, ""), {}

	for v4, v5 in t3 do
		for v8, v9 in v5[1] do
			local v6, v7

			if v9:lower():find("^" .. v2) and math.abs(t4[LocalPlayer.userId] or 0) >= (v5[3] or 0) then
				if #v5[4] > 0 then
					v6 = " " .. table.concat(v5[4], " ")
					v7 = v9
				else
					v7 = v9
					v6 = ""
				end

				table.insert(v3, (v5[2][2] and v9 .. " " .. (v5[2][2] or "") .. "\t" or "") .. "[" .. v7 .. v6 .. "]\t" .. v5[2][1])
			end
		end
	end

	return v3
end
function t9.getTime(p1, p2) --[[ getTime | Line: 365 ]]
	local v1 = p1 % 86400
	local t = { v1 % 60, v1 % 3600 / 60, v1 / 3600 }
	local v2 = t

	for v4, v5 in t do
		local v3
		local v6 = math.floor(v5)
		local v7

		if v6 < 10 then
			v3 = "0" .. v6

			if not v3 then
				v7 = v6
				v3 = v6
			end
		else
			v7 = v6
			v3 = v6
		end

		v2[v4] = v3
	end

	return v2[3] .. ":" .. v2[2] .. ":" .. v2[1]
end
function t9.getTitle(p1) --[[ getTitle | Line: 374 ]]
	if p1 == 8 then
		return "Admin Creator"
	end

	if p1 >= 6 then
		return "Game Creator"
	end

	if p1 == 5 then
		return "Owner"
	end

	if p1 == 4 then
		return "Super Admin"
	end

	if p1 == 3 then
		return "Administrator"
	end

	if p1 == 2 then
		return "Moderator"
	end

	if p1 == 1 then
		return "VIP"
	end

	return "Player"
end
function t9.getNameFromId(p1, p2) --[[ getNameFromId | Line: 384 | Upvalues: t5 (copy), t (copy) ]]
	local ok, result = pcall(function() --[[ Line: 385 | Upvalues: t5 (ref), p1 (ref), t (ref) ]]
		return t5[p1] or t.Players:GetNameFromUserIdAsync(p1)
	end)
	local v1 = ok
	local v2 = if v1 and result then result else "???"

	if v2 ~= "???" then
		t5[v1] = v2
	end

	return v2
end
function t9.getNamesFromIds(p1) --[[ getNamesFromIds | Line: 394 | Upvalues: t (copy), t5 (copy) ]]
	local t2 = {}
	local t3 = {}

	local function flush() --[[ flush | Line: 397 | Upvalues: t (ref), t3 (copy), t5 (ref), t2 (copy) ]]
		local ok, result = pcall(t.User.GetUserInfosByUserIdsAsync, t.User, t3)

		if not ok then
			table.clear(t3)

			return
		end

		for v1, v2 in result do
			t5[v2.Id] = v2.Username
			table.insert(t2, v2)
		end

		table.clear(t3)
	end

	for v1, v2 in p1 do
		local v3 = t5[v2]

		if v3 then
			table.insert(t2, {
				Id = v2,
				Username = v3
			})

			continue
		end

		table.insert(t3, v2)

		if #t3 >= 200 then
			flush()
		end
	end

	if not (#t3 > 0) then
		return t2
	end

	flush()

	return t2
end
function t9.getWords(p1, p2) --[[ getWords | Line: 423 ]]
	local t = {}

	for v1 in p1:gmatch("%S+") do
		t[#t + 1] = v1
	end

	return t
end
function t9.getCmds(p1, p2, p3) --[[ getCmds | Line: 430 | Upvalues: t9 (copy), t2 (ref), t3 (ref) ]]
	local v1 = p1:lower()
	local sum, v2, v3 = 0, v1, {}

	for v4, v5 in t9.getWords(v1) do
		if v5:find(t2.Prefix, 1, true) == 1 then
			local v7 = v5:sub(#t2.Prefix + 1)

			for v8, v9 in t3 do
				for v10, v11 in v9[1] do
					if v7 == v11:lower() then
						sum = sum + v2:sub(sum + 1, #v2):find(t2.Prefix .. v11:lower())

						if #v3 > 0 then
							v3[#v3][3] = sum - 1
						end

						v3[#v3 + 1] = { v9, sum }
					end
				end
			end
		end
	end

	return v3
end

local v21 = "TextBox"
local v22 = nil

local function f23(p13) --[[ Line: 8 | Upvalues: v21 (copy), v22 (copy) ]]
	local v1 = Instance.new(v21)

	for v2, v3 in p13 do
		if type(v2) == "number" then
			v3.Parent = v1

			continue
		end

		v1[v2] = v3
	end

	v1.Parent = v1.Parent or v22

	return v1
end

local v24 = f23({
	AutoLocalize = false,
	Font = "SourceSans",
	FontSize = "Size14",
	TextColor3 = Color3.new(255/255, 255/255, 255/255),
	BackgroundColor3 = Color3.new(),
	[v4] = 0.75,
	[v5] = 1,
	BorderSizePixel = 0,
	TextXAlignment = "Left",
	Size = UDim2.new(1, -10, 0, 20),
	ClipsDescendants = true,
	Selectable = true,
	TextEditable = false,
	ClearTextOnFocus = false,
	ZIndex = 7
})
local t10 = {
	LastSpace = 0,
	Fly = nil,
	Noclip = nil,
	Note = nil
}
local v25 = nil

t.UIS.TextBoxFocused:connect(function() --[[ Line: 470 | Upvalues: v25 (ref) ]]
	v25 = true
end)
t.UIS.TextBoxFocusReleased:connect(function() --[[ Line: 473 | Upvalues: v25 (ref) ]]
	v25 = false
end)
v13.Changed:connect(t9.UpdateAdmins)
v14.Changed:connect(function() --[[ Line: 477 | Upvalues: t6 (ref), t9 (copy), v14 (ref) ]]
	t6 = t9.unCache(v14.Value)
end)
t9.UpdateAdmins()

local v26 = t9.unCache(v14.Value)

Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local t11 = {}
local v28 = -1
local v29 = t9.template.CommandBar:Clone()
local v30 = false
local CmdBar = v29.CmdBar

v29.Parent = v20
CmdBar.FocusLost:connect(function(p1, p2) --[[ Line: 490 | Upvalues: CmdBar (ref), t11 (copy), v28 (ref), v12 (copy), t9 (copy), t2 (ref), v30 (ref), v29 (copy) ]]
	local Text = CmdBar.Text

	if p1 and Text:gsub("%s", "") ~= "" then
		local v1 = table.find(t11, Text)

		if v1 then
			table.remove(t11, v1)
		end

		if #t11 > 32 then
			table.remove(t11, 1)
		end

		v28 = -1
		table.insert(t11, Text)
		v12:FireServer(t9.uID .. "KCmdBar", (if Text:find(t2.Prefix, 1, true) == 1 then "" else t2.Prefix) .. Text)
	end

	if v30 or not v29.Visible then
		CmdBar.Text = ""

		return
	end

	v30 = true
	t9.Hide(v29)
	v30 = false
	CmdBar.Text = ""
end)
CmdBar.Changed:connect(function(p1) --[[ Line: 514 | Upvalues: v29 (copy), CmdBar (ref), t9 (copy) ]]
	local List = v29:FindFirstChild("List")

	if not List then
		return
	end

	local v1 = CmdBar.Text:match("%w+") or ""
	local v3 = if #v1 > 0 then t9.PredictCmds(v1) or {} else {}

	for v4, v5 in List:GetChildren() do
		v5.Visible = v3[v4] and true or false
		v5.Text = v3[v4] or ""
	end
end)
t.UIS.InputBegan:connect(function(p1, p2) --[[ Line: 526 | Upvalues: v25 (ref), t10 (copy), t2 (ref), v1 (ref), LocalPlayer (ref), v30 (ref), CmdBar (ref), v29 (copy), t9 (copy), v28 (ref), t11 (copy) ]]
	if v25 or (p2 or p1.KeyCode ~= Enum.KeyCode.Space) then
		if not t2.CommandBar then
			return
		end

		if (t2.CommandBar or v1(LocalPlayer, "KCmdBar")) and (not v25 and (not p2 and (p1.KeyCode == Enum.KeyCode.Semicolon and not v30))) then
			task.wait()
			CmdBar:CaptureFocus()

			if not v29.Visible then
				v30 = true
				t9.Show(v29)
				v30 = false
			end

			return
		end

		if p1.KeyCode == Enum.KeyCode.Up and (CmdBar:IsFocused() and (t2.CommandBar or v1(LocalPlayer, "KCmdBar"))) then
			v28 = math.clamp(v28 + 1, -1, #t11 - 1)
			CmdBar.Text = t11[#t11 - v28] or CmdBar.Text
		else
			if p1.KeyCode ~= Enum.KeyCode.Down or not (CmdBar:IsFocused() and (t2.CommandBar or v1(LocalPlayer, "KCmdBar"))) then
				return
			end

			v28 = math.clamp(v28 - 1, -1, #t11 - 1)
			CmdBar.Text = t11[#t11 - v28] or ""
		end

		CmdBar.CursorPosition = #CmdBar.Text + 1
	else
		local v7 = t10.Noclip or t10.Fly

		if v7 and tick() - t10.LastSpace < 0.3 then
			v7.Value = not v7.Value
		end

		t10.LastSpace = tick()
	end
end)

local v31 = nil
local v32 = t9.template.Credit:Clone()
local v33 = false
local Main = v32.Main

v32.Parent = v20
t9.Drag(Main, 250, 250)
function ToggleCredit() --[[ ToggleCredit | Line: 569 | Upvalues: v33 (ref), t9 (copy), Main (ref) ]]
	if v33 then
		return
	end

	v33 = true
	t9[if Main.Visible then "Hide" else "Show"](Main)
	v33 = false
end
v32.Toggle.Activated:Connect(ToggleCredit)
Main.Close.Activated:Connect(ToggleCredit)

local Trail = Main.Trail
local Hat = Main.Hat
local Shine = Main.Shine
local v34 = if KDonor.Value > 0 then true else false
local v35 = if KDonor.Value > 2 then true else false
local v36 = if KDonor.Value > 3 then true else false

Trail.Visible = v34
Hat.Visible = v35
Shine.Visible = v36
KDonor.Changed:Connect(function() --[[ Line: 579 | Upvalues: Main (ref), KDonor (copy) ]]
	local v2 = if KDonor.Value > 2 then true else false
	local v3 = if KDonor.Value > 3 then true else false

	Main.Trail.Visible = KDonor.Value > 0
	Main.Hat.Visible = v2
	Main.Shine.Visible = v3
end)
Main.Get.Activated:Connect(function() --[[ Line: 582 | Upvalues: t (copy), LocalPlayer (ref) ]]
	t.Market:PromptPurchase(LocalPlayer, 172732271)
end)

for v37, v38 in {
	{ 129760409821083, 10 },
	{ 77680874300094, 80 },
	{ 88978146769822, 320 },
	{ 115403290087767, 480 },
	{ 130880915606069, 800 }
} do
	local v39 = Main["D" .. v37]
	local ok, result = pcall(t.Market.GetProductInfoAsync, t.Market, v38[1], Enum.InfoType.Asset)

	v39.Text = (ok and result.PriceInRobux or v38[2]) .. " R$"
	v39.Activated:Connect(function() --[[ Line: 597 | Upvalues: v31 (ref), v38 (copy), v12 (copy), t9 (copy) ]]
		v31 = v38[1]
		v12:FireServer(t9.uID .. "KBulkPurchase", v38[1])
	end)
end

t.Market.PromptBulkPurchaseFinished:Connect(function(p1, p2, p3) --[[ Line: 602 | Upvalues: LocalPlayer (ref), v12 (copy), t9 (copy) ]]
	local id = p3.Items[1].id

	if p1 == LocalPlayer and (id == 88978146769822 or (id == 115403290087767 or id == 130880915606069)) then
		v12:FireServer(t9.uID .. "KVIPCheck")
	end
end)
Main.Hat.Activated:Connect(function() --[[ Line: 609 | Upvalues: v12 (copy), t9 (copy) ]]
	v12:FireServer(t9.uID .. "KHat")
end)
Main.Trail.Activated:Connect(function() --[[ Line: 612 | Upvalues: v12 (copy), t9 (copy) ]]
	v12:FireServer(t9.uID .. "KTrail")
end)
Main.Shine.Activated:Connect(function() --[[ Line: 615 | Upvalues: v12 (copy), t9 (copy) ]]
	v12:FireServer(t9.uID .. "KShine")
end)
Main.Join.Activated:Connect(function() --[[ Line: 618 | Upvalues: t (copy), Main (ref) ]]
	local ok, result = pcall(t.Group.PromptJoinAsync, t.Group, 3403354)

	if not ok then
		return
	end

	if result == Enum.GroupMembershipStatus.None then
		return
	end

	Main.Join:Destroy()
end)
task.spawn(function() --[[ Line: 627 | Upvalues: LocalPlayer (ref), Main (ref) ]]
	local ok, result = pcall(LocalPlayer.IsInGroup, LocalPlayer, 3403354)

	if not (ok and result) then
		return
	end

	Main.Join:Destroy()
end)
wrap(function() --[[ Line: 634 | Upvalues: v32 (copy) ]]
	local v1 = false

	while true do
		local v2

		task.wait(1)

		local v4 = tick()

		repeat
			local v5

			task.wait()
			v2 = tick() - v4
			v5 = if v1 and v2 then v2 else math.max(0, 1 - v2)
			v32.Toggle.ImageColor3 = Color3.new(v5, v5, v5)
		until v2 > 1

		v1 = not v1
	end
end)

local LogService = game:GetService("LogService")
local v41 = t9.template.Direct:Clone()

v41.Parent = v20
v41.Close.Activated:Connect(function() --[[ Line: 654 | Upvalues: v41 (copy) ]]
	v41.Visible = false
end)
LogService.MessageOut:Connect(function(p1, p2) --[[ Line: 658 | Upvalues: v31 (ref), v41 (copy) ]]
	if p2 ~= Enum.MessageType.MessageWarning or not (string.find(p1, "AllowThirdPartySales") and (string.find(p1, "3403354") and v31)) then
		return
	end

	v41.Link.Text = "roblox.com/game-pass/" .. v31
	v41.Visible = true
end)

local Players = game:GetService("Players")

game:GetService("TextChatService").SendingMessage:Connect(function(p1) --[[ Line: 674 | Upvalues: t2 (ref), v12 (copy), t9 (copy) ]]
	if string.find(p1.Text, t2.Prefix, 1, true) ~= 1 then
		return
	end

	v12:FireServer(t9.uID .. "KCmdBar", p1.Text)
end)

local function Cape(p1, p2, p3, p4, p5) --[[ Cape | Line: 681 | Upvalues: v1 (ref), v5 (ref), t9 (copy), wrap (copy) ]]
	local v12 = p2 or Color3.new()
	local v2 = v1(p1, "HumanoidRootPart")
	local v3 = v1(p1, "Humanoid")

	if p1 and (v2 and v3) then
		local v4 = CFrame.new(0, 0.925, 0.5)
		local v52 = -3
		local v6 = 0
		local v7 = 0
		local v8 = "Part"
		local v9 = nil
		local v10, _ = (function(p13) --[[ Line: 8 | Upvalues: v8 (copy), v9 (copy) ]]
			local v1 = Instance.new(v8)

			for v2, v3 in p13 do
				if type(v2) == "number" then
					v3.Parent = v1

					continue
				end

				v1[v2] = v3
			end

			v1.Parent = v1.Parent or v9

			return v1
		end)({
			Name = "KCape",
			Parent = p1,
			CanCollide = false,
			Transparency = 1,
			FormFactor = 3,
			Size = Vector3.new(1.9, 3.8, 0.2),
			TopSurface = 0,
			BottomSurface = 0
		})
		local v11 = "Weld"
		local v122 = nil

		local function f13(p13) --[[ Line: 8 | Upvalues: v11 (copy), v122 (copy) ]]
			local v1 = Instance.new(v11)

			for v2, v3 in p13 do
				if type(v2) == "number" then
					v3.Parent = v1

					continue
				end

				v1[v2] = v3
			end

			v1.Parent = v1.Parent or v122

			return v1
		end

		local v14 = f13({
			Parent = v2,
			Part0 = v2,
			Part1 = v10,
			C0 = v4 * CFrame.Angles(math.rad(v52), 0, 0),
			C1 = CFrame.new(0, 1.9, 0)
		})
		local v15 = "SelectionBox"
		local v16 = nil

		(function(p13) --[[ Line: 8 | Upvalues: v15 (copy), v16 (copy) ]]
			local v1 = Instance.new(v15)

			for v2, v3 in p13 do
				if type(v2) == "number" then
					v3.Parent = v1

					continue
				end

				v1[v2] = v3
			end

			v1.Parent = v1.Parent or v16

			return v1
		end)({
			Parent = v10,
			Adornee = v10,
			SurfaceColor3 = v12,
			SurfaceTransparency = 0,
			Transparency = 1,
			LineThickness = 0
		})

		if p3 then
			local v17 = "SurfaceGui"
			local v18 = nil

			local function f19(p13) --[[ Line: 8 | Upvalues: v17 (copy), v18 (copy) ]]
				local v1 = Instance.new(v17)

				for v2, v3 in p13 do
					if type(v2) == "number" then
						v3.Parent = v1

						continue
					end

					v1[v2] = v3
				end

				v1.Parent = v1.Parent or v18

				return v1
			end

			local t = {
				Parent = v10,
				Face = "Back"
			}
			local v20 = "ImageLabel"
			local v21 = nil

			local function f22(p13) --[[ Line: 8 | Upvalues: v20 (copy), v21 (copy) ]]
				local v1 = Instance.new(v20)

				for v2, v3 in p13 do
					if type(v2) == "number" then
						v3.Parent = v1

						continue
					end

					v1[v2] = v3
				end

				v1.Parent = v1.Parent or v21

				return v1
			end

			local t2 = {
				Size = UDim2.new(1, 0, 1, 0),
				[v5] = 1
			}

			t2.Image = if p3 then "rbxassetid://" .. t9.RImage(p3) or "" else ""
			t[1] = f22(t2)
			f19(t)
		end

		local function v24(p1) --[[ Animate | Line: 723 | Upvalues: wrap (ref), v6 (ref), v2 (ref), v3 (ref), v10 (copy), t9 (ref), v7 (ref), v52 (ref), v14 (ref), v4 (copy), v24 (copy) ]]
			wrap(function() --[[ Line: 724 | Upvalues: p1 (ref), v6 (ref), v2 (ref), v3 (ref) ]]
				while not p1 do
					v6 = (v2.CFrame:inverse() * (v2.CFrame + v3.MoveDirection)).z * v2.Velocity.magnitude
					task.wait()
				end
			end)
			wrap(function() --[[ Line: 730 | Upvalues: v10 (ref), t9 (ref), v7 (ref), v2 (ref), v52 (ref), v6 (ref), v14 (ref), v4 (ref), p1 (ref), v24 (ref) ]]
				while v10 and t9.onCam(v10.Position) do
					task.wait()
					v7 = v2.Velocity.y
					v52 = math.min(-3, (math.max(v52 * 0.9 + (v7 + v6) * 0.25, if v7 < 0 then -170 else -100)))
					v14.C0 = v4 * CFrame.Angles(math.rad(v52), 0, 0)
				end

				p1 = true

				if not v10 then
					return
				end

				while v10 and not t9.onCam(v10.Position) do
					task.wait()
				end

				v24()
			end)
		end

		local v25 = nil

		wrap(function() --[[ Line: 724 | Upvalues: v25 (ref), v6 (ref), v2 (ref), v3 (ref) ]]
			while not v25 do
				v6 = (v2.CFrame:inverse() * (v2.CFrame + v3.MoveDirection)).z * v2.Velocity.magnitude
				task.wait()
			end
		end)
		wrap(function() --[[ Line: 730 | Upvalues: v10 (copy), t9 (ref), v7 (ref), v2 (ref), v52 (ref), v6 (ref), v14 (ref), v4 (copy), v25 (ref), v24 (copy) ]]
			while v10 and t9.onCam(v10.Position) do
				task.wait()
				v7 = v2.Velocity.y
				v52 = math.min(-3, (math.max(v52 * 0.9 + (v7 + v6) * 0.25, if v7 < 0 then -170 else -100)))
				v14.C0 = v4 * CFrame.Angles(math.rad(v52), 0, 0)
			end

			v25 = true

			if not v10 then
				return
			end

			while v10 and not t9.onCam(v10.Position) do
				task.wait()
			end

			v24()
		end)
	end
end

local v42 = t.Collection:GetTagged("KAICrown")
local v43 = t.Collection:GetTagged("KAIRCrown")

t.Run.Heartbeat:connect(function() --[[ Line: 752 | Upvalues: v42 (copy), v43 (copy) ]]
	if not (#v42 > 0 or #v43 > 0) then
		return
	end

	local v1 = time()
	local v2 = v1 % 6.283185307179586
	local v3 = CFrame.new(0, math.sin(v2) / 8, 0) * CFrame.Angles(0, v2, 0)
	local v4 = Color3.fromHSV(v1 / 10 % 1, 1, 1)

	for v5, v6 in v42 do
		if v6 and v6.Parent then
			if v6.Handle:FindFirstChild("AccessoryWeld") then
				v6.Handle.AccessoryWeld.C1 = v3
			end

			continue
		end

		table.remove(v42, v5)
	end

	for v7, v8 in v43 do
		if v8 and v8.Parent then
			if v8.Handle:FindFirstChild("AccessoryWeld") then
				v8.Handle.AccessoryWeld.C1 = v3
			end

			local Fire = v8.Handle.Fire

			v8.Handle.Color = v4
			Fire.SecondaryColor = v4

			continue
		end

		table.remove(v43, v7)
	end
end)
t.Collection:GetInstanceAddedSignal("KAICrown"):Connect(function(p1) --[[ Line: 779 | Upvalues: v42 (copy) ]]
	table.insert(v42, p1)
end)
t.Collection:GetInstanceAddedSignal("KAIRCrown"):Connect(function(p1) --[[ Line: 782 | Upvalues: v43 (copy) ]]
	table.insert(v43, p1)
end)
t.Collection:GetInstanceRemovedSignal("KAICrown"):Connect(function(p1) --[[ Line: 785 | Upvalues: v42 (copy) ]]
	table.remove(v42, table.find(v42, p1))
end)
t.Collection:GetInstanceRemovedSignal("KAIRCrown"):Connect(function(p1) --[[ Line: 788 | Upvalues: v43 (copy) ]]
	table.remove(v43, table.find(v43, p1))
end)
function t9.HookList(p1, p2, p3, p4) --[[ HookList | Line: 793 | Upvalues: v1 (ref), wrap (copy), t9 (copy) ]]
	local v2 = v1(p1, "List") or v1(p1, "BG")
	local v3 = false
	local v4 = p1.Hide.Activated:Connect(function() --[[ Line: 796 | Upvalues: v3 (ref), v2 (ref), wrap (ref), t9 (ref), p1 (copy) ]]
		if v3 then
			return
		end

		v3 = true

		if v2.Parent.Name ~= "BG" then
			wrap(t9[if p1.BG.Visible then "Hide" else "Show"], v2)
		end

		t9[if p1.BG.Visible then "Hide" else "Show"](p1.BG)
		p1.Hide.Text = if p1.BG.Visible then "-" else "+"
		v3 = false
	end)
	local _ = p1.Close.Activated:Connect(function() --[[ Line: 807 | Upvalues: v4 (ref), p3 (ref), t9 (ref), p1 (copy) ]]
		v4:disconnect()
		p3:disconnect()
		t9.Hide(p1, true)
	end)
end
function t9.CreateList(p1, p2, p3, p4) --[[ Line: 813 | Upvalues: t9 (copy), v20 (copy) ]]
	local v1 = t9.template.List:Clone()

	v1.Parent = v20
	v1.Title.Text = p1
	v1.Name = p1
	t9.HookList(v1)

	return v1
end
function t9.FixUI(p1) --[[ Line: 820 | Upvalues: v5 (ref), t2 (ref), t9 (copy) ]]
	if p1.Name == "BG" or p1.Name == "Bar" then
		p1[v5] = t2.ColorTransparency
		p1.BackgroundColor3 = t2.Color
	end

	for v1, v2 in p1:GetChildren() do
		t9.FixUI(v2)
	end
end
function t9.UpdateUI() --[[ Line: 829 | Upvalues: t2 (ref), v1 (ref), LocalPlayer (ref), t9 (copy), v20 (copy) ]]
	if not t2.ForcedColor then
		if v1(LocalPlayer, "KColor") then
			t2.Color = LocalPlayer.KColor.Value
		end

		if v1(LocalPlayer, "KColorTransparency") then
			t2.ColorTransparency = LocalPlayer.KColorTransparency.Value
		end
	end

	t9.FixUI(v20)

	for v12, v2 in t9.template do
		t9.FixUI(v2)
	end
end
function t9.UpdateSet() --[[ Line: 843 | Upvalues: t9 (copy), v32 (copy), t2 (ref) ]]
	t9.UpdateAdmins()
	v32.Toggle.Visible = t2.AdminCredit
	t9.UpdateUI()
end
function t9.BumpList(p1) --[[ Line: 848 ]]
	for v1, v2 in p1.List:GetChildren() do
		v2.Position = UDim2.new(0, 5, 0, (v1 - 1) * 20)
	end
end
function t9.NoteCheck(p1, p2) --[[ Line: 853 ]]
	return if p1[1] <= p2.X and (p1[2] >= p2.X and p1[3] <= p2.Y) then p1[4] >= p2.Y else false
end
function t9.Note(p1, p2, p3, p4) --[[ Line: 856 | Upvalues: t10 (copy), t9 (copy), v20 (copy), wrap (copy), v6 (ref), v7 (ref), v11 (ref), t (copy) ]]
	p1.MouseEnter:connect(function() --[[ Line: 857 | Upvalues: p3 (ref), t10 (ref), t9 (ref), p2 (copy), v20 (ref), wrap (ref), p4 (ref), p1 (copy), v6 (ref), v7 (ref), v11 (ref), t (ref) ]]
		p3 = t10.Note

		if not p3 then
			local v1, v2

			p3 = t9.template.Note:Clone()
			t10.Note = p3
			v1 = p3
			v2 = v20
			p3.Text = p2 or ""
			p3.Parent = v20
			p3.Size = UDim2.new(0, p3.TextBounds.X + 10, 0, 24)
			p3.Visible = true
			wrap(function() --[[ Line: 867 | Upvalues: p4 (ref), p1 (ref), v6 (ref), v7 (ref), p3 (ref), v11 (ref), t (ref), t9 (ref) ]]
				p4 = {
					p1[v6].X,
					p1[v6].X + p1[v7].X,
					p1[v6].Y,
					p1[v6].Y + p1[v7].Y
				}

				repeat
					p3.Position = UDim2.new(0, v11.X, 0, v11.Y + t.Gui.TopbarInset.Height - 8)
					task.wait()
				until not (p3 and (v11 and t9.NoteCheck(p4, v11)))

				if not p3 then
					return
				end

				p3:Destroy()
			end)

			return
		end

		p3:Destroy()
		p3 = t9.template.Note:Clone()
		t10.Note = p3
		p3.Text = p2 or ""
		p3.Parent = v20
		p3.Size = UDim2.new(0, p3.TextBounds.X + 10, 0, 24)
		p3.Visible = true
		wrap(function() --[[ Line: 867 | Upvalues: p4 (ref), p1 (ref), v6 (ref), v7 (ref), p3 (ref), v11 (ref), t (ref), t9 (ref) ]]
			p4 = {
				p1[v6].X,
				p1[v6].X + p1[v7].X,
				p1[v6].Y,
				p1[v6].Y + p1[v7].Y
			}

			repeat
				p3.Position = UDim2.new(0, v11.X, 0, v11.Y + t.Gui.TopbarInset.Height - 8)
				task.wait()
			until not (p3 and (v11 and t9.NoteCheck(p4, v11)))

			if not p3 then
				return
			end

			p3:Destroy()
		end)
	end)
end
function t9.Search(p1, p2, p3, p4) --[[ Line: 879 ]]
	local v2, v3 = if p3 then p3 else function(p1, p2) --[[ Line: 880 ]]
	return p1 == p2
end, {}

	for v4, v5 in p1 do
		if v2(v5, p2) then
			if type(v4) == "string" then
				v3[v4] = v5

				continue
			end

			v3[#v3 + 1] = v5
		end
	end

	return v3
end
function t9.GetSearch(p1, p2) --[[ Line: 894 | Upvalues: t9 (copy) ]]
	local v1 = t9.template.Search:Clone()

	v1.Parent = p1

	return v1
end
function t9.KeyDown(p1) --[[ Line: 899 | Upvalues: t (copy) ]]
	return t.UIS:IsKeyDown(p1)
end
function t9.HookToggle(p1, p2) --[[ Line: 902 | Upvalues: v12 (copy), t9 (copy), t2 (ref) ]]
	p1.Activated:Connect(function(p12) --[[ Line: 903 | Upvalues: p1 (copy), p2 (copy), v12 (ref), t9 (ref), t2 (ref) ]]
		local isBackgroundColor3 = p1.BackgroundColor3 == Color3.new()

		p1.BackgroundColor3 = isBackgroundColor3 and Color3.new(255/255, 255/255, 255/255) or Color3.new()

		if not p2 then
			return
		end

		p2(p1, isBackgroundColor3)
		v12:FireServer(t9.uID .. "KUpdate", t2)
	end)
end
function t9.HookInput(p1, p2) --[[ Line: 912 | Upvalues: v12 (copy), t9 (copy), t2 (ref) ]]
	p1.Changed:connect(function(p12) --[[ Line: 913 | Upvalues: p1 (copy), p2 (copy), v12 (ref), t9 (ref), t2 (ref) ]]
		if p12 ~= "Text" or p1.Text == "" then
			return
		end

		p2(p1)
		v12:FireServer(t9.uID .. "KUpdate", t2)
	end)
end

local t12 = {
	Flat = "Gives the UI a flat appearance",
	ForcedColor = "Forces everyone to have set color & transparency",
	Color = "Changes the Color of the user interface",
	ColorTransparency = "Changes the Transparency of the user interface",
	AdminCredit = "Enables the credit GUI for that appears in the bottom right",
	AutoClean = "Enables automatic cleaning of hats & tools in the Workspace",
	AutoCleanDelay = "The delay between each AutoClean routine",
	CommandBar = "Enables the Command Bar | GLOBAL KEYBIND: ;",
	FunCommands = "Enables fun yet unnecessary commands",
	FreeAdmin = "Set to 1-5.\t1-VIP 2-Mod 3-Admin 4-SuperAdmin 5-Owner",
	PublicLogs = "Allows all users to see the command & chat logs",
	Prefix = "Character to begin a command"
}
local v44 = false

function ClientEvent(p1, p2) --[[ ClientEvent | Line: 936 | Upvalues: t9 (copy), t4 (ref), t2 (ref), t3 (ref), t7 (ref), t8 (ref), CurrentCamera (ref), LocalPlayer (ref), Character (ref), v11 (ref), PlayerGui (ref), v12 (copy), v15 (ref), v16 (ref), t (copy), v1 (ref), v20 (copy), wrap (copy), v24 (copy), t12 (copy), v13 (ref), v26 (ref), v14 (ref), Players (copy), t10 (copy), WaitForChild (copy), v25 (ref), Cape (copy), v44 (ref) ]]
	if p1 == "KuID" then
		t9.uID = p2[1]
		t4 = p2[2]
		t2 = p2[3]
		t3 = p2[4]
		t7 = p2[5]
		t8 = p2[6]
		t9.UpdateSet()

		return
	end

	if not (CurrentCamera and (LocalPlayer and (Character and (v11 and PlayerGui)))) then
		t9.UpdateVar()
	end

	if p1 == "KCrash" then
		while true do

		end
	elseif p1 == "KPing" then
		v12:FireServer(t9.uID .. "KPing")
	elseif p1 == "KUpdate" and p2 then
		t2 = p2
		t9.UpdateSet()
	elseif p1 == "KUpdateLog" and p2 then
		if #t7 > 300 then
			table.remove(t7, #t7)
		end

		table.insert(t7, 1, p2)
		v15.Value = not v15.Value
	elseif p1 == "KUpdateCLog" and p2 then
		if #t8 > 300 then
			table.remove(t8, #t8)
		end

		table.insert(t8, 1, p2)
		v16.Value = not v16.Value
	elseif p1 == "KUpdateLogs" and p2 then
		t7 = p2
		table.sort(p2, function(p1, p2) --[[ Line: 967 ]]
			return p1[1] > p2[1]
		end)
		v15.Value = not v15.Value
	elseif p1 == "KUpdateCLogs" and p2 then
		t8 = p2
		table.sort(p2, function(p1, p2) --[[ Line: 973 ]]
			return p1[1] > p2[1]
		end)
		v16.Value = not v16.Value
	elseif p1 == "KFakeChat" then
		v12:FireServer(t9.uID .. "KChat", { LocalPlayer.Name, p2 })
	elseif p1 == "KBuy" then
		t.Market:PromptPurchase(LocalPlayer, p2)
	elseif p1 == "KBuyBundle" then
		t.Market:PromptBundlePurchase(LocalPlayer, p2)
	elseif p1 == "KBuyGamePass" then
		t.Market:PromptGamePassPurchase(LocalPlayer, p2)
	elseif p1 == "KBuyProduct" then
		t.Market:PromptProductPurchase(LocalPlayer, p2)
	elseif p1 == "KHelp" then
		local v10 = v1(v20, "Help")

		if v10 then
			wrap(t9.Hide, v10, true)
		end

		local v112 = t9.template.Help:Clone()

		v112.List.Prefix.Text = "The prefix is \"" .. t2.Prefix .. "\""
		v112.Parent = v20
		t9.HookList(v112)
		t9.Drag(v112, 300, 300)
		t9.Show(v112)
	elseif p1 == "KTools" then
		if v1(v20, "Tools") then
			wrap(t9.Hide, v20.Tools, true)
		end

		local v122 = t9.CreateList("Tools")

		table.sort(p2)

		for v132, v142 in p2 do
			local v152 = v24:Clone()
			local v162 = UDim2.new(0, 5, 0, (v132 - 1) * 20)

			v152.Parent = v122.List
			v152.Text = v142
			v152.Position = v162
		end

		v122.List.CanvasSize = UDim2.new(1, 0, 0, #v122.List:GetChildren() * 20)
		t9.Drag(v122, 200, 220)
		t9.Show(v122)
	elseif p1 == "KSettings" then
		local v17 = v1(v20, "Settings")

		if v17 then
			wrap(t9.Hide, v17, true)
		end

		if not p2 then
			return
		end

		t2 = p2

		local v18 = t9.template.Settings:Clone()

		v18.Parent = v20
		t9.HookList(v18)

		if t2.IGS then
			v18.Toggle.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
			v18.List.Visible = true
		end

		t9.HookToggle(v18.Toggle, function(p1, p2) --[[ Line: 1027 | Upvalues: t2 (ref), wrap (ref), t9 (ref), v18 (copy) ]]
			t2.IGS = p2
			p1.Parent.List.Visible = p2

			if p2 then
				return
			end

			wrap(t9.Hide, v18, true)
		end)

		for v19, v202 in v18.List:GetChildren() do
			if v202:IsA("GuiObject") then
				local Text = v202.Text

				if t2[Text] ~= nil then
					t9.Note(v202, t12[Text])

					if Text == "Color" then
						local v21 = t2[Text].r * 255
						local v22 = t2[Text].g * 255
						local v23 = t2[Text].b * 255

						v202.Input1.Text = v21
						v202.Input2.Text = v22
						v202.Input3.Text = v23
						t9.HookInput(v202.Input1, function(p1, p2) --[[ Line: 1042 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = tonumber(p1.Text)

							if v1 and (v1 <= 255 and v1 >= 0) then
								t2[Text] = Color3.new(v1 / 255, t2[Text].g, t2[Text].b)
							else
								p1.Text = t2[Text]
							end
						end)
						t9.HookInput(v202.Input2, function(p1, p2) --[[ Line: 1050 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = tonumber(p1.Text)

							if v1 and (v1 <= 255 and v1 >= 0) then
								t2[Text] = Color3.new(t2[Text].r, v1 / 255, t2[Text].b)
							else
								p1.Text = t2[Text]
							end
						end)
						t9.HookInput(v202.Input3, function(p1, p2) --[[ Line: 1058 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = tonumber(p1.Text)

							if v1 and (v1 <= 255 and v1 >= 0) then
								t2[Text] = Color3.new(t2[Text].r, t2[Text].g, v1 / 255)
							else
								p1.Text = t2[Text]
							end
						end)

						continue
					end

					if Text == "ColorTransparency" then
						v202.Input.Text = t2[Text]
						t9.HookInput(v202.Input, function(p1, p2) --[[ Line: 1068 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = tonumber(p1.Text)

							if v1 and (v1 <= 1 and v1 >= 0) then
								t2[Text] = v1

								return
							end

							if p1.Text == "." then
								return
							end

							p1.Text = t2[Text]
						end)

						continue
					end

					if Text == "AutoCleanDelay" then
						v202.Input.Text = t2[Text]
						t9.HookInput(v202.Input, function(p1, p2) --[[ Line: 1078 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = tonumber(p1.Text)

							if v1 and v1 >= 0 then
								t2[Text] = v1
							else
								p1.Text = t2[Text]
							end
						end)

						continue
					end

					if Text == "Prefix" then
						v202.Input.Text = t2[Text]
						t9.HookInput(v202.Input, function(p1, p2) --[[ Line: 1088 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = p1.Text:gsub("%s", "")

							if #v1 == 1 then
								t2[Text] = v1
							else
								p1.Text = t2[Text]
							end
						end)

						continue
					end

					if Text == "FreeAdmin" then
						local v242 = t2[Text]
						local v252 = t2[Text] or ""
						local v262 = t2[Text] and Color3.new(255/255, 255/255, 255/255) or Color3.new()

						v202.Input.Visible = v242
						v202.Input.Text = v252
						v202.Toggle.BackgroundColor3 = v262
						t9.HookInput(v202.Input, function(p1, p2) --[[ Line: 1099 | Upvalues: t2 (ref), Text (ref) ]]
							local v1 = tonumber(p1.Text)

							if v1 and (v1 < 6 and v1 > 0) then
								t2[Text] = v1
							else
								p1.Text = t2[Text]
							end
						end)
						t9.HookToggle(v202.Toggle, function(p1, p2) --[[ Line: 1107 | Upvalues: v202 (copy), t2 (ref), Text (ref) ]]
							v202.Input.Visible = p2

							if p2 then
								return
							end

							t2[Text] = p2
						end)

						continue
					end

					if v1(v202, "Toggle") then
						v202.Toggle.BackgroundColor3 = t2[Text] and Color3.new(255/255, 255/255, 255/255) or Color3.new()
						t9.HookToggle(v202.Toggle, function(p1, p2) --[[ Line: 1115 | Upvalues: t2 (ref), Text (ref) ]]
							t2[Text] = p2
						end)
					else
						continue
					end
				end
			end
		end

		t9.Drag(v18, 200, 220)
		t9.Show(v18)
	elseif p1 == "KCmds" then
		local v28 = v1(v20, "Commands")

		if v28 then
			wrap(t9.Hide, v28, true)
		end

		local v29 = t9.CreateList("Commands")
		local List, _ = t9.template.Blank:Clone()
		local List2 = v29.List

		List.Parent = v29
		List.Name = "List"
		List2.Parent = List
		v29.Size = UDim2.new(0, 300, 0, 20)
		List2.Size = UDim2.new(1, 0, 0, 260)
		v29.BG.Size = UDim2.new(1, 0, 0, 260)

		local t5 = {}

		for v30, v31 in p2[1] do
			if v31[3] <= p2[2] or p2[3][v31[1][1]] then
				table.insert(t5, v31)
			end
		end

		table.sort(t5, function(p1, p2) --[[ Line: 1140 ]]
			return p1[1][1] < p2[1][1]
		end)

		local function f32(p1) --[[ Line: 1143 | Upvalues: List2 (ref), v24 (ref), t9 (ref), t2 (ref) ]]
			for v1, v2 in List2:GetChildren() do
				v2:Destroy()
			end

			for v3, v4 in p1 do
				local v5 = v24:Clone()
				local v7 = v3 .. "\t" .. v4[1][1] .. " " .. table.concat(v4[4], " ")
				local v8 = UDim2.new(0, 5, 0, (v3 - 1) * 20)

				v5.FontSize = "Size18"
				v5.Parent = List2
				v5.Text = v7
				v5.Position = v8
				t9.Note(v5, t9.getTitle(v4[3]) .. "+\t" .. t2.Prefix .. "[" .. table.concat(v4[1], "/") .. "] " .. (v4[2][2] or ""))
			end

			List2.CanvasSize = UDim2.new(1, 0, 0, #List2:GetChildren() * 20)
		end

		local BG = t9.GetSearch(List).BG

		BG.Parent.Position = UDim2.new(0, 0, 0, 282)
		BG.Changed:connect(function(p1) --[[ Line: 1163 | Upvalues: f32 (copy), t9 (ref), t5 (copy), BG (copy) ]]
			if p1 ~= "Text" then
				return
			end

			f32(t9.Search(t5, BG.Text, function(p1, p2, p3) --[[ Line: 1165 ]]
				for v1, v2 in p1[1] do
					if v2:lower():find(p2:lower()) then
						p3 = true
					end
				end

				return p3
			end))
		end)
		f32(t5)
		t9.Drag(v29, 300, 300)
		t9.Show(v29)
	elseif p1 == "KAdmins" then
		local v33 = v1(v20, "Admins")

		if v33 then
			wrap(t9.Hide, v33, true)
		end

		local v34 = t9.CreateList("Admins")

		local function List() --[[ List | Line: 1184 | Upvalues: v34 (copy), t4 (ref), t (ref), t9 (ref), v24 (ref) ]]
			local t2 = {}

			for v1, v2 in v34.List:GetChildren() do
				v2:Destroy()
			end

			for v3, v4 in t4 do
				if math.abs(v4) ~= 1 or t.Players:GetPlayerByUserId(v3) then
					table.insert(t2, v3)
				end
			end

			local v5 = t9.getNamesFromIds(t2)

			table.sort(v5, function(p1, p2) --[[ Line: 1195 | Upvalues: t4 (ref) ]]
				local v2 = math.abs(t4[p1.Id])
				local v4 = math.abs(t4[p2.Id])

				if v4 < v2 then
					return true
				end

				if v2 < v4 then
					return false
				end

				return p1.Username < p2.Username
			end)

			for v6, v7 in v5 do
				local v8 = t4[v7.Id]
				local v9 = v24:Clone()
				local v10 = v24:Clone()
				local v12 = (if v8 < 0 then "P. " else "") .. t9.getTitle((math.abs(v8)))
				local v13 = UDim2.new(0.5, 0, 0, 20)
				local v14 = UDim2.new(0.5, 0, 0, 0)

				v10.Text = v12
				v10.TextXAlignment = "Right"
				v10.Parent = v9
				v10.Size = v13
				v10.Position = v14

				local v15 = UDim2.new(0, 5, 0, (v6 - 1) * 20)

				v9.Parent = v34.List
				v9.Text = v7.Username
				v9.Position = v15
				v34.List.CanvasSize = UDim2.new(1, 0, 0, #v34.List:GetChildren() * 20)
			end
		end

		List()

		local v35 = nil

		v35 = v13.Changed:connect(function() --[[ Line: 1221 | Upvalues: v34 (copy), v20 (ref), v35 (ref), List (copy) ]]
			if v34 and v34.Parent == v20 then
				task.wait()
				List()
			else
				v35:disconnect()
			end
		end)
		t9.Drag(v34, 200, 220)
		t9.Show(v34)
	elseif p1 == "KBans" then
		local v36 = v1(v20, "Bans")

		if v36 then
			wrap(t9.Hide, v36, true)
		end

		local v37 = t9.CreateList("Bans")

		local function List() --[[ List | Line: 1237 | Upvalues: v37 (copy), v26 (ref), t9 (ref), v24 (ref), wrap (ref) ]]
			local t = {}

			for v1, v2 in v37.List:GetChildren() do
				v2:Destroy()
			end

			for v3, v4 in v26 do
				table.insert(t, (tonumber(v3)))
			end

			local v6 = t9.getNamesFromIds(t)

			table.sort(v6, function(p1, p2) --[[ Line: 1246 | Upvalues: v26 (ref) ]]
				local v1 = string.lower(v26[p1.Id])
				local v2 = string.lower(v26[p2.Id])

				if v2 < v1 then
					return true
				end

				if v1 < v2 then
					return false
				end

				return string.lower(p1.Username) < string.lower(p2.Username)
			end)

			for v7, v8 in v6 do
				local v9 = v24:Clone()
				local v10 = v24:Clone()

				wrap(function() --[[ Line: 1259 | Upvalues: v10 (copy), v26 (ref), v8 (copy), v9 (copy), v7 (copy), v37 (ref), t9 (ref) ]]
					v10.TextXAlignment = "Right"
					v10.Size = UDim2.new(0.5, 0, 0, 20)
					v10.Position = UDim2.new(0.5, 0, 0, 0)
					v10.Text = if v26[v8.Id] < 2 then "Permanently" else "From Server"
					v10.Parent = v9
					v9.Text = v8.Username
					v9.Position = UDim2.new(0, 5, 0, (v7 - 1) * 20)
					v9.Parent = v37.List
					v37.List.CanvasSize = UDim2.new(1, 0, 0, #v37.List:GetChildren() * 20)

					if not (v26[v8.Id] < -1) then
						return
					end

					local v3 = -v26[v8.Id]

					repeat
						local v5 = math.floor(v3 - os.time())

						v10.Text = v5 .. " seconds"
						task.wait(1)
					until not v9 or v5 <= 0

					if not v9 then
						return
					end

					v9:Destroy()
					t9.BumpList(v37)
				end)
			end
		end

		List()

		local v38 = nil

		v38 = v14.Changed:connect(function() --[[ Line: 1286 | Upvalues: v37 (copy), v20 (ref), v38 (ref), List (copy) ]]
			if v37 and v37.Parent == v20 then
				task.wait()
				List()
			else
				v38:disconnect()
			end
		end)
		t9.Drag(v37, 200, 220)
		t9.Show(v37)
	elseif p1 == "KLogs" then
		local v39 = v1(v20, p2)

		if v39 then
			wrap(t9.Hide, v39, true)
		end

		local v40, _, _2 = t9.CreateList(p2)

		v40.Size = UDim2.new(0, 300, 0, 20)
		v40.BG.Size = UDim2.new(1, 0, 0, 260)

		local BG = v40.BG
		local List = v40.List
		local v41 = UDim2.new()
		local v42 = UDim2.new(1, 0, 1, 0)

		List.Position = v41
		List.Size = v42
		List.Parent = BG

		local function f43(p1) --[[ Line: 1307 | Upvalues: List (ref), v24 (ref), t9 (ref) ]]
			local count = 0

			for v1, v2 in List:GetChildren() do
				v2:Destroy()
			end

			for v3, v4 in p1 do
				if v4[1] and v4[2] then
					count = count + 1

					local v5 = v24:Clone()
					local v7 = t9.getTime(v4[1]) .. "\t" .. v4[2]
					local v8 = UDim2.new(0, 5, 0, (count - 1) * 20)

					v5.FontSize = "Size18"
					v5.Parent = List
					v5.Text = v7
					v5.Position = v8
					t9.Note(v5, v4[2]:match(":%s(.+)"))
				end
			end

			List.CanvasSize = UDim2.new(1, 0, 0, #List:GetChildren() * 20)
		end

		local BG2 = t9.GetSearch(BG).BG

		BG2.Parent.Position = UDim2.new(0, 0, 1, 2)
		BG2.Changed:connect(function(p1) --[[ Line: 1325 | Upvalues: f43 (copy), t9 (ref), t7 (ref), BG2 (copy) ]]
			if p1 ~= "Text" then
				return
			end

			f43(t9.Search(t7, BG2.Text, function(p1, p2) --[[ Line: 1327 ]]
				return p1[2]:lower():find(p2:lower())
			end))
		end)
		f43(t7)

		local v442 = nil

		v442 = v15.Changed:connect(function() --[[ Line: 1334 | Upvalues: v40 (copy), v20 (ref), v442 (ref), BG2 (copy), f43 (copy), t7 (ref) ]]
			if not v40 or v40.Parent ~= v20 then
				v442:disconnect()

				return
			end

			if BG2.Text:gsub("%s", "") ~= "" and BG2.Text ~= "Type here to search" then
				return
			end

			f43(t7)
		end)
		t9.Drag(v40, 300, 300)
		t9.Resize(BG, 300, 260)
		t9.Show(v40)
	elseif p1 == "KCLogs" then
		local v45 = v1(v20, p2)

		if v45 then
			wrap(t9.Hide, v45, true)
		end

		local v46, _, _2 = t9.CreateList(p2)
		local BG = v46.BG
		local List = v46.List

		List.Parent = BG
		v46.Size = UDim2.new(0, 300, 0, 20)

		local v47 = UDim2.new()
		local v48 = UDim2.new(1, 0, 1, 0)

		List.Position = v47
		List.Size = v48
		v46.BG.Size = UDim2.new(1, 0, 0, 260)

		local function f49(p1) --[[ Line: 1357 | Upvalues: List (ref), v24 (ref), t9 (ref) ]]
			local count = 0

			for v1, v2 in List:GetChildren() do
				v2:Destroy()
			end

			for v3, v4 in p1 do
				if v4[1] and v4[2] then
					count = count + 1

					local v5 = v24:Clone()
					local v7 = t9.getTime(v4[1]) .. "\t" .. v4[2]
					local v8 = UDim2.new(0, 5, 0, (count - 1) * 20)

					v5.FontSize = "Size18"
					v5.Parent = List
					v5.Text = v7
					v5.Position = v8
					t9.Note(v5, v4[2]:match(":%s(.+)"))
				end
			end

			List.CanvasSize = UDim2.new(1, 0, 0, #List:GetChildren() * 20)
		end

		local BG2 = t9.GetSearch(BG).BG

		BG2.Parent.Position = UDim2.new(0, 0, 1, 2)
		BG2.Changed:connect(function(p1) --[[ Line: 1375 | Upvalues: f49 (copy), t9 (ref), t8 (ref), BG2 (copy) ]]
			if p1 ~= "Text" then
				return
			end

			f49(t9.Search(t8, BG2.Text, function(p1, p2) --[[ Line: 1377 ]]
				return p1[2]:lower():find(p2:lower())
			end))
		end)
		f49(t8)

		local v50 = nil

		v50 = v16.Changed:connect(function() --[[ Line: 1384 | Upvalues: v46 (copy), v20 (ref), v50 (ref), BG2 (copy), f49 (copy), t8 (ref) ]]
			if not v46 or v46.Parent ~= v20 then
				v50:disconnect()

				return
			end

			if BG2.Text:gsub("%s", "") ~= "" and BG2.Text ~= "Type here to search" then
				return
			end

			f49(t8)
		end)
		t9.Drag(v46, 300, 300)
		t9.Resize(BG, 300, 260)
		t9.Show(v46)
	elseif p1 == "KCountDown" then
		local v51, v52 = unpack(p2)

		if not (v51 and tonumber(v52)) then
			return
		end

		local v53 = v1(v20, "Timer")

		if v53 then
			wrap(t9.Hide, v53, true)
			task.delay(2, t.Run.UnbindFromRenderStep, t.Run, "kCircleProgress")
		end

		local v54 = t9.template.Timer:Clone()

		v54.Time.Text = v52
		v54.Parent = v20

		local t5 = {
			v54.Circle1,
			v54.Circle2,
			v54.Circle3,
			v54.Circle4
		}
		local v55 = tick()

		local function circleProgress() --[[ circleProgress | Line: 1411 | Upvalues: v55 (copy), v52 (copy), t5 (copy) ]]
			local v2 = math.clamp((tick() - v55) / v52, 0, 1)

			for v3, v4 in t5 do
				local v5 = math.clamp((v2 - (v3 - 1) / 4) * 4, 0, 1)

				if v5 > 0 then
					local v6 = math.floor(v5 * 255)

					v4.ImageRectOffset = Vector2.new(v6 % 16 * 64, math.floor(v6 / 16) * 64)
					v4.Visible = true

					continue
				end

				v4.Visible = false
			end
		end

		task.spawn(function() --[[ Line: 1427 | Upvalues: t (ref), circleProgress (copy), t9 (ref), v54 (copy), v55 (copy), v52 (copy), v51 (copy) ]]
			t.Run:BindToRenderStep("kCircleProgress", 1, circleProgress)
			t9.Show(v54)

			while tick() - v55 < v52 and (v51 and v51.Parent) do
				task.wait()
				v54.Time.Text = math.clamp(math.floor(v52 - (tick() - v55)) + 1, 0, v52)
			end

			t9.Hide(v54, true)
			task.delay(2, t.Run.UnbindFromRenderStep, t.Run, "kCircleProgress")
		end)
	elseif p1 == "KMsg" then
		local v56 = v1(v20, "Msg")

		if v56 then
			wrap(t9.Hide, v56, true)
		end

		local v57 = t9.template.Msg:Clone()
		local v58 = p2[4] and Players:GetUserThumbnailAsync(p2[4], Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		local Owner = v57.Owner
		local Title = v57.Title
		local Msg = v57.Msg

		v57.Parent = v20
		Owner.Text = p2[1]
		Title.Text = p2[2]
		Msg.Text = p2[3]

		local v63 = if p2[1] == "Kohl\'s Admin Infinite" then true else false

		if v63 or v58 then
			v57.User.Image = if v63 then "rbxassetid://314925538" else v58
			v57.User.Position = UDim2.new(0.5, -80 - v57.Owner.TextBounds.X / 2, v57.User.Position.Y.Scale, v57.User.Position.Y.Offset)
			v57.User.Visible = true
		end

		t9.Show(v57)
		task.wait(math.sqrt(#tostring(p2[3])) + 0.5)
		t9.Hide(v57, true)
	elseif p1 == "KHint" then
		local v68 = v1(v20, "Hint")

		if v68 then
			wrap(t9.Hide, v68, true)
		end

		local v69 = t9.template.Hint:Clone()
		local BG = v69.BG

		v69.Parent = v20
		BG.Text = p2
		t9.Show(v69)
		task.wait(math.sqrt(#p2) + 0.5)
		t9.Hide(v69, true)
	elseif p1 == "KNotify" then
		local v70 = v1(v20, "Notify")

		if v70 then
			wrap(t9.Hide, v70, true)
		end

		if not p2 then
			return
		end

		local Notify = t9.template.Hint:Clone()
		local BG = Notify.BG

		Notify.Name = "Notify"
		Notify.Parent = v20
		BG.Text = p2
		t9.Show(Notify)
	elseif p1 == "KError" then
		local v72 = v1(v20, "Error")

		if v72 then
			wrap(t9.Hide, v72, true)
		end

		if not p2 then
			return
		end

		local v73 = t9.template.Error:Clone()

		v73.Msg.Text = p2
		v73.Parent = v20
		t9.Show(v73)

		local v75 = task.wait

		v75((math.max(2, math.sqrt(#p2) / 2 + 1)))
		t9.Hide(v73, true)
	elseif p1 == "KWatch" then
		CurrentCamera.CameraSubject = p2 or LocalPlayer.Character
	elseif p1 == "KBlind" then
		local v79 = v1(v20, "Blind")

		if v79 then
			wrap(t9.Hide, v79, true)
		end

		if not p2 then
			return
		end

		local v80 = t9.template.Blind:Clone()

		v80.Parent = v20
		t9.Show(v80)
	elseif p1 == "KLag" then
		while v1(LocalPlayer, "KLag") do
			for i = 1, 999 do
				print((Vector3.new() - Vector3.new()).Magnitude)
			end

			task.wait()
		end
	elseif p1 == "KMute" then
		t10.Muted = p2
		t.StarterGui:SetCore("ChatBarDisabled", p2)
		t.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "You have been " .. (if p2 then "" else "un") .. "muted.",
			Color = Color3.new(255/255, 0/255, 0/255)
		})
	elseif p1 == "KRefresh" then
		local t5 = { CurrentCamera.CFrame, CurrentCamera.Focus, Character.HumanoidRootPart.CFrame }

		wrap(function() --[[ Line: 1515 | Upvalues: LocalPlayer (ref), WaitForChild (ref), t5 (copy), CurrentCamera (ref) ]]
			local v1 = nil

			v1 = LocalPlayer.CharacterAdded:connect(function(p1) --[[ Line: 1517 | Upvalues: WaitForChild (ref), t5 (ref), CurrentCamera (ref), v1 (ref) ]]
				local v2 = WaitForChild(p1, "HumanoidRootPart")

				repeat
					v2.CFrame = t5[3]
					task.wait()
				until (v2.Position - t5[3].Position).magnitude < 1

				CurrentCamera.CoordinateFrame = t5[1]
				CurrentCamera.Focus = t5[2]
				v1:disconnect()
			end)
		end)
		v12:FireServer(t9.uID .. "KRefresh")
	elseif p1 == "KPhase" then
		Character.Parent = Character.Parent == CurrentCamera and workspace or CurrentCamera
		Character:MakeJoints()
	elseif p1 == "KFly" then
		local Fly = t10.Fly

		if Fly then
			Fly.Value = nil
			Fly.Parent.BodyVelocity:Destroy()
			Fly.Parent.BodyGyro:Destroy()
			Fly:Destroy()
			t10.Fly = nil
		end

		local v85 = v1(Character, "Humanoid")
		local v86 = v1(Character, "HumanoidRootPart")

		if not (v85 and v86) then
			return
		end

		if p2 then
			local v87, v88, v89 = Vector3.new()
			local v90 = "BodyGyro"
			local v91 = nil

			local function f92(p13) --[[ Line: 8 | Upvalues: v90 (copy), v91 (copy) ]]
				local v1 = Instance.new(v90)

				for v2, v3 in p13 do
					if type(v2) == "number" then
						v3.Parent = v1

						continue
					end

					v1[v2] = v3
				end

				v1.Parent = v1.Parent or v91

				return v1
			end

			local v93 = f92({
				D = 200,
				P = 5000,
				Parent = v86,
				cframe = v86.CFrame
			})
			local v94 = "BodyVelocity"
			local v95 = nil

			local function f96(p13) --[[ Line: 8 | Upvalues: v94 (copy), v95 (copy) ]]
				local v1 = Instance.new(v94)

				for v2, v3 in p13 do
					if type(v2) == "number" then
						v3.Parent = v1

						continue
					end

					v1[v2] = v3
				end

				v1.Parent = v1.Parent or v95

				return v1
			end

			local v97 = f96({
				Parent = v86
			})
			local v98 = "BoolValue"
			local v99 = nil

			local function f100(p13) --[[ Line: 8 | Upvalues: v98 (copy), v99 (copy) ]]
				local v1 = Instance.new(v98)

				for v2, v3 in p13 do
					if type(v2) == "number" then
						v3.Parent = v1

						continue
					end

					v1[v2] = v3
				end

				v1.Parent = v1.Parent or v99

				return v1
			end

			local v101 = f100({
				Name = "KFly",
				Parent = v86
			})

			t10.Fly = v101
			v101.Changed:connect(function(p1) --[[ Line: 1550 | Upvalues: v101 (ref), t10 (ref), v85 (copy), v93 (copy), v97 (copy) ]]
				if v101 ~= t10.Fly then
					return
				end

				local v1 = v101.Value
				local v2 = if v1 then Vector3.new(9000000000, 9000000000, 9000000000) else Vector3.new()

				v85.PlatformStand = v1
				v93.MaxTorque = v2
				v97.MaxForce = v2
			end)
			v101.Value = true
			wrap(function() --[[ Line: 1558 | Upvalues: v101 (ref), v88 (ref), v89 (ref), v85 (copy), CurrentCamera (ref), v87 (ref), v25 (ref), t9 (ref), v93 (copy), v97 (copy), t10 (ref), v86 (copy) ]]
				while true do
					if v101.Value then
						task.wait()

						local v1 = CurrentCamera.CFrame

						v88 = v85.MoveDirection
						v89 = v1
						v88 = (v1:inverse() * CFrame.new(v1.Position + v88)).Position
						v87 = v87 * 0.95
						v87 = Vector3.new(math.max(-100, (math.min(100, v87.x + v88.x * 5))), math.max(-100, (math.min(100, t9.KeyDown(Enum.KeyCode.Space) and v87.y + 5 or (t9.KeyDown(Enum.KeyCode.LeftControl) and v87.y - 5 or v87.y)))), (math.max(-100, (math.min(100, v87.z + v88.z * 5)))))

						local v16 = (v1 * CFrame.new(v87)).Position - v1.Position

						v93.cframe = v1
						v97.velocity = v16
					else
						task.wait()
					end

					if not v101 or (v101 ~= t10.Fly or not (v85 and v86)) then
						return
					end
				end
			end)
		else
			v85.PlatformStand = false
		end
	elseif p1 == "KNoclip" then
		local Noclip = t10.Noclip

		if Noclip then
			Noclip.Value = nil
			Noclip:Destroy()
			t10.Noclip = nil
		end

		local v102 = v1(Character, "Humanoid")
		local v103 = v1(Character, "HumanoidRootPart")

		if not (v102 and v103) then
			return
		end

		if p2 then
			local v104 = Vector3.new()
			local magnitude = (CurrentCamera.CFrame.Position - v103.Position).magnitude
			local v105 = nil
			local v106 = nil
			local v107 = v11.WheelBackward:connect(function() --[[ Line: 1603 | Upvalues: magnitude (ref) ]]
				magnitude = math.min(magnitude + 2.5, 100)
			end)
			local v108 = v11.WheelForward:connect(function() --[[ Line: 1606 | Upvalues: magnitude (ref) ]]
				magnitude = math.max(magnitude - 2.5, 2.5)
			end)
			local v109 = "BoolValue"
			local v110 = nil

			local function f111(p13) --[[ Line: 8 | Upvalues: v109 (copy), v110 (copy) ]]
				local v1 = Instance.new(v109)

				for v2, v3 in p13 do
					if type(v2) == "number" then
						v3.Parent = v1

						continue
					end

					v1[v2] = v3
				end

				v1.Parent = v1.Parent or v110

				return v1
			end

			local v112 = f111({
				Name = "KNoclip",
				Parent = Character
			})

			t10.Noclip = v112
			v112.Changed:connect(function(p1) --[[ Line: 1611 | Upvalues: v112 (ref), t10 (ref), v103 (copy), magnitude (ref), CurrentCamera (ref), v102 (copy) ]]
				if v112 ~= t10.Noclip then
					return
				end

				local v1 = v112.Value

				if v103 and v1 then
					magnitude = (CurrentCamera.CFrame.Position - v103.Position).magnitude
				end

				CurrentCamera.CameraType = if v1 then "Fixed" else "Custom"
				v102.WalkSpeed = if v1 then 0 else 16
				v102.PlatformStand = v1
				v103.Anchored = v1
				v103.Anchored = v1
			end)
			v112.Value = true
			wrap(function() --[[ Line: 1622 | Upvalues: v112 (ref), v105 (ref), v106 (ref), CurrentCamera (ref), v102 (copy), v104 (ref), v25 (ref), t9 (ref), magnitude (ref), v103 (copy), t10 (ref), v107 (ref), v108 (ref) ]]
				while true do
					if v112.Value then
						task.wait()

						local v1 = CurrentCamera.CFrame

						v105 = v1
						v106 = v102.MoveDirection
						v106 = (v1:inverse() * CFrame.new(v1.Position + v106)).Position
						v104 = v104 * 0.9

						local v2 = 0.06 + v104.magnitude * 0.1

						v104 = Vector3.new(math.min(5, (math.max(-5, v104.x + v106.x * v2))), t9.KeyDown(Enum.KeyCode.Space) and v104.y + v2 or (t9.KeyDown(Enum.KeyCode.LeftControl) and v104.y - v2 or v104.y), (math.min(5, (math.max(-5, v104.z + v106.z * v2)))))

						if v104.magnitude > 0.1 then
							CurrentCamera.CFrame = v1 * CFrame.new(v104)
							v105 = CurrentCamera.CFrame
							CurrentCamera.Focus = v1 * CFrame.new(0, 0, -magnitude)
							v106 = CurrentCamera.Focus * CFrame.new(0, 0, -1)
							v106 = CFrame.new(CurrentCamera.Focus.Position, (Vector3.new(v106.x, CurrentCamera.Focus.y, v106.z))) - Vector3.new(0, 1.5, 0)
							v103.CFrame = v106
						end
					else
						task.wait()
					end

					if not v112 or (v112 ~= t10.Noclip or not (v102 and v103)) then
						v107:disconnect()
						v108:disconnect()

						return
					end
				end
			end)
			v102.Died:connect(function() --[[ Line: 1655 | Upvalues: LocalPlayer (ref), CurrentCamera (ref), WaitForChild (ref) ]]
				LocalPlayer.CharacterAdded:Wait()
				CurrentCamera.CameraSubject = WaitForChild(LocalPlayer.Character, "Humanoid")
			end)
		else
			CurrentCamera.CameraType = "Custom"
			v102.WalkSpeed = 16
			v102.PlatformStand = false
			v103.Anchored = false
			v103.Anchored = false
		end
	elseif p1 == "KCape" and p2 then
		if v1(p2[1], "KCape") then
			p2[1].KCape:Destroy()
		end

		if not p2[4] then
			return
		end

		Cape(p2[1], p2[2], p2[3])
	elseif p1 == "KGlitch" then
		local v113 = v1(Character, "KGlitch")

		if v113 then
			v113:Destroy()
		end

		if not p2 then
			return
		end

		local v114 = "IntValue"
		local v115 = nil

		local function f116(p13) --[[ Line: 8 | Upvalues: v114 (copy), v115 (copy) ]]
			local v1 = Instance.new(v114)

			for v2, v3 in p13 do
				if type(v2) == "number" then
					v3.Parent = v1

					continue
				end

				v1[v2] = v3
			end

			v1.Parent = v1.Parent or v115

			return v1
		end

		local v117 = f116({
			Name = "KGlitch",
			Parent = Character
		})
		local v118 = v1(Character, "HumanoidRootPart")
		local v119 = true

		while v117 and (v117.Parent == Character and v118) do
			v118.CFrame = v118.CFrame + Vector3.new(0, 0, (if v119 then 1 else -1) * p2)
			task.wait()
			v119 = not v119
		end
	elseif p1 == "KGlitch2" then
		local v124 = v1(Character, "KGlitch")

		if v124 then
			v124:Destroy()
		end

		if not p2 then
			return
		end

		local v125 = "IntValue"
		local v126 = nil

		local function f127(p13) --[[ Line: 8 | Upvalues: v125 (copy), v126 (copy) ]]
			local v1 = Instance.new(v125)

			for v2, v3 in p13 do
				if type(v2) == "number" then
					v3.Parent = v1

					continue
				end

				v1[v2] = v3
			end

			v1.Parent = v1.Parent or v126

			return v1
		end

		local v128 = f127({
			Name = "KGlitch",
			Parent = Character
		})
		local v129 = v1(Character, "HumanoidRootPart")
		local v130 = true

		while v128 and (v128.Parent == Character and v129) do
			v129.CFrame = v129.CFrame * CFrame.new(0, 0, (if v130 then 1 else -1) * p2)
			task.wait()
			v130 = not v130
		end
	elseif p1 == "KVibrate" then
		local v136 = v1(Character, "KGlitch")

		if v136 then
			v136:Destroy()
		end

		if not p2 then
			return
		end

		local v137 = "IntValue"
		local v138 = nil

		local function f139(p13) --[[ Line: 8 | Upvalues: v137 (copy), v138 (copy) ]]
			local v1 = Instance.new(v137)

			for v2, v3 in p13 do
				if type(v2) == "number" then
					v3.Parent = v1

					continue
				end

				v1[v2] = v3
			end

			v1.Parent = v1.Parent or v138

			return v1
		end

		local v140 = f139({
			Name = "KGlitch",
			Parent = Character
		})
		local v141 = v1(Character, "HumanoidRootPart")

		CFrame.new()

		local v142 = 0

		while v140 and (v140.Parent == Character and v141) do
			v141.CFrame = v141.CFrame * (if v142 == 0 then CFrame.new(p2, 0, 0) elseif v142 == 1 then CFrame.new(-p2, 0, 0) elseif v142 == 2 then CFrame.new(0, 0, p2) else CFrame.new(0, 0, -p2))
			task.wait()
			v142 = (v142 + 1) % 4
		end
	elseif p1 == "KFOV" then
		CurrentCamera.FieldOfView = math.min(120, (math.max(1, p2)))
	elseif p1 == "KVote" then
		local v146 = v1(v20, "Vote")

		if v146 then
			wrap(t9.Hide, v146, true)
		end

		local v147 = t9.template.Vote:Clone()

		v147.Visible = true
		v147.Msg.Text = p2
		v147.Parent = v20

		local v148 = nil
		local v149 = nil

		v148 = v147.Y.Activated:Connect(function() --[[ Line: 1743 | Upvalues: v148 (ref), v149 (ref), wrap (ref), t9 (ref), v147 (copy), v12 (ref) ]]
			v148:disconnect()
			v149:disconnect()
			v148 = nil
			v149 = nil
			wrap(t9.Hide, v147, true)
			v12:FireServer(t9.uID .. "KVote", true)
		end)
		v149 = v147.N.Activated:Connect(function() --[[ Line: 1746 | Upvalues: v148 (ref), v149 (ref), wrap (ref), t9 (ref), v147 (copy), v12 (ref) ]]
			v148:disconnect()
			v149:disconnect()
			v148 = nil
			v149 = nil
			wrap(t9.Hide, v147, true)
			v12:FireServer(t9.uID .. "KVote", false)
		end)
		task.delay(9, function() --[[ Line: 1749 | Upvalues: v147 (copy), v20 (ref), v148 (ref), wrap (ref), t9 (ref) ]]
			if v147.Parent ~= v20 or not v148 then
				return
			end

			wrap(t9.Hide, v147, true)
		end)
		t9.Show(v147)
	elseif p1 == "KCredit" then
		ToggleCredit()
	elseif p1 == "KCam" then
		v12:FireServer(t9.uID .. "KCam", CurrentCamera.CFrame)
	elseif p1 == "KPlaySound" then
		if not p2 then
			return
		end

		p2.Volume = if v44 then 0 else 1
		p2:Play()
	else
		if p1 ~= "KMuteMusic" then
			return
		end

		v44 = not v44

		for v151, v152 in workspace:GetChildren() do
			if v152.Name == "KMusic" then
				v152.Volume = if v44 then 0 else 1
			end
		end
	end
end
v12.OnClientEvent:connect(ClientEvent)
v12:FireServer("KuID")

if not v1(v12, "KNotify") then
	LocalPlayer.CharacterAdded:connect(function(p13) --[[ Line: 1778 | Upvalues: Character (ref), CurrentCamera (ref), WaitForChild (copy) ]]
		local CurrentCamera2 = workspace.CurrentCamera

		Character = p13
		CurrentCamera = CurrentCamera2
		CurrentCamera2.CameraSubject = WaitForChild(p13, "Humanoid")
	end)

	return
end

ClientEvent("KNotify", v12.KNotify.Value)
LocalPlayer.CharacterAdded:connect(function(p13) --[[ Line: 1778 | Upvalues: Character (ref), CurrentCamera (ref), WaitForChild (copy) ]]
	local CurrentCamera2 = workspace.CurrentCamera

	Character = p13
	CurrentCamera = CurrentCamera2
	CurrentCamera2.CameraSubject = WaitForChild(p13, "Humanoid")
end)
