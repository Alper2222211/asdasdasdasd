local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Alper Pro Hub | Doors", HidePremium = false, IntroEnabled = true,IntroText = "Alper Pro Hub | Doors", SaveConfig = true, ConfigFolder = "Alper Pro Hub | Doors"})
local GameTab = Window:MakeTab({
    Name = "Game",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local pcl = Instance.new("SpotLight")
pcl.Brightness = 1
pcl.Face = Enum.NormalId.Front
pcl.Range = 509993489324823042342347234
pcl.Parent = game.Players.LocalPlayer.Character.Head
pcl.Enabled = false
 
GameTab:AddToggle({
        Name = "Headlight",
        Default = false,
    Callback = function(Value)
        pcl.Enabled = Value
    end
})

GameTab:AddToggle({
	Name = "FullBright",
	Default = false,
	Callback = function(Value)
		if not _G.FullBrightExecuted then

			_G.FullBrightEnabled = true
		
			_G.NormalLightingSettings = {
				Brightness = game:GetService("Lighting").Brightness,
				ClockTime = game:GetService("Lighting").ClockTime,
				FogEnd = game:GetService("Lighting").FogEnd,
				GlobalShadows = game:GetService("Lighting").GlobalShadows,
				Ambient = game:GetService("Lighting").Ambient
			}
		
			game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
				if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
					_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
					if not _G.FullBrightEnabled then
						repeat
							wait()
						until _G.FullBrightEnabled
					end
					game:GetService("Lighting").Brightness = 1
				end
			end)
		
			game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
				if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
					_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
					if not _G.FullBrightEnabled then
						repeat
							wait()
						until _G.FullBrightEnabled
					end
					game:GetService("Lighting").ClockTime = 12
				end
			end)
		
			game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
				if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
					_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
					if not _G.FullBrightEnabled then
						repeat
							wait()
						until _G.FullBrightEnabled
					end
					game:GetService("Lighting").FogEnd = 786543
				end
			end)
		
			game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
				if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
					_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
					if not _G.FullBrightEnabled then
						repeat
							wait()
						until _G.FullBrightEnabled
					end
					game:GetService("Lighting").GlobalShadows = false
				end
			end)
		
			game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
				if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
					_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
					if not _G.FullBrightEnabled then
						repeat
							wait()
						until _G.FullBrightEnabled
					end
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
			end)
		
			game:GetService("Lighting").Brightness = 1
			game:GetService("Lighting").ClockTime = 12
			game:GetService("Lighting").FogEnd = 786543
			game:GetService("Lighting").GlobalShadows = false
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		
			local LatestValue = true
			spawn(function()
				repeat
					wait()
				until _G.FullBrightEnabled
				while wait() do
					if _G.FullBrightEnabled ~= LatestValue then
						if not _G.FullBrightEnabled then
							game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
							game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
							game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
							game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
							game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
						else
							game:GetService("Lighting").Brightness = 1
							game:GetService("Lighting").ClockTime = 12
							game:GetService("Lighting").FogEnd = 786543
							game:GetService("Lighting").GlobalShadows = false
							game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
						end
						LatestValue = not LatestValue
					end
				end
			end)
		end
		
		_G.FullBrightExecuted = true
		_G.FullBrightEnabled = not _G.FullBrightEnabled
		
	end    
})


GameTab:AddToggle({
    Name = "No seek arms/obstructions",
    Default = false,
Flag = "NoSeek",
Save = true
})

GameTab:AddToggle({
    Name = "Instant Interact",
    Default = false,
Flag = "InstantToggle",
Save = true
})

GameTab:AddButton({
    Name = "No jumpscares",
    Callback = function()
    pcall(function()
        game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
    end)
    end    
})
GameTab:AddToggle({
    Name = "No Screech",
    Default = false,
Flag = "ScreechToggle",
Save = true
})

GameTab:AddToggle({
    Name = "Always win heartbeat",
    Default = false,
Flag = "HeartbeatWin",
Save = true
})
GameTab:AddToggle({
	Name = "Notify Entities",
	Default = false,
	Callback = function(Value)
		workspace.ChildAdded:Connect(function(rush)
			if rush.Name == "RushMoving" then 
				if rush:WaitForChild("RushNew").CFrame.Y >= -999 then
					OrionLib:MakeNotification({
						Name = "Entity Spawned!",
						Content = "Rush Is Spawned Find A Closet Or Bed!",
						Image = "rbxassetid://4483345998",
						Time = 5
					})
				end
			end
		end)
		workspace.ChildAdded:Connect(function(ambush)
			if ambush.Name == "AmbushMoving" then
				if ambush:WaitForChild("RushNew").CFrame.Y >= -999 then
					OrionLib:MakeNotification({
						Name = "Entity Spawned!",
						Content = "Ambush Is Spawned Find A Closet Or Bed!",
						Image = "rbxassetid://4483345998",
						Time = 5
					})
				end
			end
		end)
		workspace.ChildAdded:Connect(function(eyes)
			if eyes.name == "Eyes" then
				if eyes:WaitForChild("Core") then
					OrionLib:MakeNotification({
                        Name = "Entity Spawned!",
                        Content = "Eyes Has Spawned Look Away From Him",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
				end
			end
		end)
	end
})
GameTab:AddButton({
    Name = "Complete breaker box minigame",
    Callback = function()
    game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
    end
})

GameTab:AddParagraph("Warning","You may need to open/close the panel a few times for this to work, fixing soon.")

--// ok actual code starts here
 
game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant)
    if OrionLib.Flags["NoSeek"].Value == true and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then
        task.spawn(function()
            wait()
            descendant:Destroy()
        end)
    end
end)
 
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    if OrionLib.Flags["InstantToggle"].Value == true then
        fireproximityprompt(prompt)
    end
end)
 
local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local args = {...}
    local method = getnamecallmethod()
   
    if tostring(self) == 'Screech' and method == "FireServer" and OrionLib.Flags["ScreechToggle"].Value == true then
        args[1] = true
        return old(self,unpack(args))
    end
    if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and OrionLib.Flags["HeartbeatWin"].Value == true then
        args[2] = true
        return old(self,unpack(args))
    end
   
    return old(self,...)
end))
 
workspace.CurrentCamera.ChildAdded:Connect(function(child)
    if child.Name == "Screech" and OrionLib.Flags["ScreechToggle"].Value == true then
        child:Destroy()
    end
end)

local VisualsTab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
})
local KeyChams = {}
VisualsTab:AddToggle({
        Name = "Key Esp",
        Default = false,
    Flag = "KeyToggle",
    Save = true,
        Callback = function(Value)
                for i,v in pairs(KeyChams) do
            v.Enabled = Value
        end
        end    
})
 
local function ApplyKeyChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Adornee = inst
    Cham.Enabled = OrionLib.Flags["KeyToggle"].Value
    Cham.RobloxLocked = true
    return Cham
end
 
local KeyCoroutine = coroutine.create(function()
    workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
        if inst.Name == "KeyObtain" then
            table.insert(KeyChams,ApplyKeyChams(inst))
        end
    end)
end)
for i,v in ipairs(workspace:GetDescendants()) do
    if v.Name == "KeyObtain" then
        table.insert(KeyChams,ApplyKeyChams(v))
    end
end
coroutine.resume(KeyCoroutine)

local LeverChams = {}
VisualsTab:AddToggle({
        Name = "Lever Esp",
        Default = false,
    Flag = "LeverToggle",
    Save = true,
        Callback = function(Value)
                for i,v in pairs(LeverChams) do
            v.Enabled = Value
        end
        end    
})

local function ApplyLeverChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Adornee = inst
    Cham.Enabled = OrionLib.Flags["LeverToggle"].Value
    Cham.RobloxLocked = true
    return Cham
end
 
local LeverCoroutine = coroutine.create(function()
    workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
        if inst.Name == "LeverForGate" then
            table.insert(LeverChams,ApplyLeverChams(inst))
        end
    end)
end)
for i,v in ipairs(workspace:GetDescendants()) do
    if v.Name == "LeverForGate" then
        table.insert(LeverChams,ApplyLeverChams(v))
    end
end
coroutine.resume(LeverCoroutine)

VisualsTab:AddParagraph("Figure,Entities And Book Esp Not Added Yet","Sorry About That")

local ScriptsTab = Window:MakeTab({
	Name = "Scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ScriptsTab:AddButton({
    Name = "Vynixius Doors",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
    end    
})
ScriptsTab:AddButton({
    Name = "MSDOORS",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"),true))()
    end    
})
ScriptsTab:AddButton({
    Name = "Crucifix On Everything Q + Click For Use(Not Works For Real Entities)",
    Callback = function()
        _G.Uses = 2021031293091230129301293
        _G.Range = 1000000000
        _G.OnAnything = true
        _G.Fail = false
        loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
    end    
})
ScriptsTab:AddButton({
    Name = "Rooms A-1000 Scanner/Tablet Script",
    Callback = function()
        _G.UpdateStars = false -- stars disappear after picking up a book/breaker pole | false: a little lag
        _G.OnShop = true -- can buy on pre run shop
        _G.Price = 0 -- tablet price on shop
        _G.Description = "Makes Game Easy" -- tablet description on shop
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
    end    
})
ScriptsTab:AddButton({
    Name = "Nerd V3 Script (Doors)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/DoorsV3_ByNerd.lua"))()
    end   
})
