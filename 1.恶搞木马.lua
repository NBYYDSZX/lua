-- 等待客户端加载完成
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- 创建屏幕GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrollGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 创建主框架 (4x8长方形)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 500) -- 4:5比例接近4x8长方形
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- 圆角效果
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- 创建标题
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "<font color=\"#FF0000\">1.</font><font color=\"#FF7F00\">恶</font><font color=\"#FFFF00\">搞</font><font color=\"#00FF00\">木</font><font color=\"#00FFFF\">马</font>"
Title.Font = Enum.Font.GothamSemibold
Title.TextSize = 24
Title.TextColor3 = Color3.new(1, 1, 1)
Title.RichText = true
Title.Parent = MainFrame

-- 创建按钮框架
local ButtonFrame = Instance.new("Frame")
ButtonFrame.Name = "ButtonFrame"
ButtonFrame.Size = UDim2.new(1, -40, 1, -100)
ButtonFrame.Position = UDim2.new(0, 20, 0, 70)
ButtonFrame.BackgroundTransparency = 1
ButtonFrame.Parent = MainFrame

-- 创建垂直布局
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ButtonFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 20)

-- 开启按钮
local OnButton = Instance.new("TextButton")
OnButton.Name = "OnButton"
OnButton.Size = UDim2.new(1, 0, 0, 60)
OnButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
OnButton.BorderSizePixel = 0
OnButton.Text = "开启"
OnButton.Font = Enum.Font.GothamSemibold
OnButton.TextSize = 20
OnButton.TextColor3 = Color3.new(1, 1, 1)
OnButton.Parent = ButtonFrame

-- 开启按钮圆角
local OnButtonCorner = Instance.new("UICorner")
OnButtonCorner.CornerRadius = UDim.new(0, 10)
OnButtonCorner.Parent = OnButton

-- 关闭按钮
local OffButton = Instance.new("TextButton")
OffButton.Name = "OffButton"
OffButton.Size = UDim2.new(1, 0, 0, 60)
OffButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
OffButton.BorderSizePixel = 0
OffButton.Text = "关闭"
OnButton.Font = Enum.Font.GothamSemibold
OffButton.TextSize = 20
OffButton.TextColor3 = Color3.new(1, 1, 1)
OffButton.Parent = ButtonFrame

-- 关闭按钮圆角
local OffButtonCorner = Instance.new("UICorner")
OffButtonCorner.CornerRadius = UDim.new(0, 10)
OffButtonCorner.Parent = OffButton

-- 状态变量
local isTrolling = false
local spinningParts = {}

-- 开启功能
OnButton.MouseButton1Click:Connect(function()
    if isTrolling then return end
    isTrolling = true
    
    -- 按钮视觉反馈
    OnButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    wait(0.2)
    OnButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    
    -- 获取所有其他玩家
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = player.Character.PrimaryPart or player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and rootPart then
                -- 创建旋转部件（不可见，仅用于定位）
                local spinPart = Instance.new("Part")
                spinPart.Size = Vector3.new(0.5, 0.5, 0.5)
                spinPart.Transparency = 1
                spinPart.CanCollide = false
                spinPart.Anchored = false
                spinPart.Parent = workspace
                
                -- 创建可见效果（可选）
                local effectPart = Instance.new("Part")
                effectPart.Size = Vector3.new(1, 1, 1)
                effectPart.Color = Color3.fromRGB(255, 0, 0)
                effectPart.Transparency = 0.7
                effectPart.CanCollide = false
                effectPart.Anchored = true
                effectPart.Parent = workspace
                
                local weld = Instance.new("Weld")
                weld.Part0 = spinPart
                weld.Part1 = effectPart
                weld.C0 = CFrame.new(0, 1, 0) -- 效果部件在玩家上方
                weld.Parent = spinPart
                
                -- 存储旋转信息
                table.insert(spinningParts, {
                    player = player,
                    spinPart = spinPart,
                    effectPart = effectPart,
                    angle = 0,
                    distance = 3 -- 20cm = 0.2 studs，这里设置为3studs更明显
                })
            end
        end
    end
    
    -- 启动旋转协程
    coroutine.wrap(function()
        while isTrolling do
            for i, data in pairs(spinningParts) do
                if data.player.Character and data.player.Character:FindFirstChild("HumanoidRootPart") then
                    -- 更新角度
                    data.angle = data.angle + 0.05
                    
                    -- 计算新位置
                    local rootPart = data.player.Character.HumanoidRootPart
                    local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X + math.cos(data.angle) * data.distance
                    local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z + math.sin(data.angle) * data.distance
                    
                    -- 设置位置（使用spinPart作为参考）
                    data.spinPart.Position = Vector3.new(x, rootPart.Position.Y, z)
                    rootPart.CFrame = CFrame.new(data.spinPart.Position) * CFrame.Angles(0, data.angle + math.pi, 0)
                else
                    -- 玩家离开，清理
                    data.effectPart:Destroy()
                    data.spinPart:Destroy()
                    spinningParts[i] = nil
                end
            end
            wait()
        end
    end)()
end)

-- 关闭功能
OffButton.MouseButton1Click:Connect(function()
    if not isTrolling then return end
    isTrolling = false
    
    -- 按钮视觉反馈
    OffButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    wait(0.2)
    OffButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    
    -- 清理所有旋转部件
    for i, data in pairs(spinningParts) do
        if data.spinPart then data.spinPart:Destroy() end
        if data.effectPart then data.effectPart:Destroy() end
        spinningParts[i] = nil
    end
    
    -- 重置玩家位置（可选）
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Parent then
                humanoid.PlatformStand = false
            end
        end
    end
end)

-- 初始状态
OnButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
OffButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

-- 防止UI被销毁
local function preventDestroy(instance)
    local connection
    connection = instance.Destroying:Connect(function()
        connection:Disconnect()
        warn("尝试销毁UI被阻止!")
        -- 重新创建UI
        wait()
        ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
    end)
end

preventDestroy(ScreenGui)
preventDestroy(MainFrame)