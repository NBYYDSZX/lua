        while getgenv().AutoSkill1 do
            local SpinSpeed = 5
            local Height = 1
            local Radius = 4
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player ~= Player then
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        Player.Character.HumanoidRootPart.CFrame = CFrame.new(
                            player.Character.HumanoidRootPart.Position + 
                            Vector3.new(
                                math.sin(tick() * SpinSpeed * math.pi) * Radius, 
                                Height, 
                                math.cos(tick() * SpinSpeed * math.pi) * Radius
                            ),
                            player.Character.HumanoidRootPart.Position
                        )
                        
                        workspace.Gravity = 0
                        
                        if Player.Character:FindFirstChildOfClass("Tool") then
                            local args = {[1] = "swingKatana"}
                            game:GetService("ReplicatedStorage"):FindFirstChild("ninjaEvent"):FireServer(unpack(args))
                        else
                            for _, tool in pairs(Player.Backpack:GetChildren()) do
                                if tool:IsA("Tool") then
                                    Player.Character.Humanoid:EquipTool(tool)
                                end
                            end
                        end
                    end
                end
            end
            wait()
        end
        workspace.Gravity = 196.2
    end},
    {name = "获取所有宝箱", var = "AutoTeleport1", func = function() 
        while getgenv().AutoTeleport1 do
            local playerHead = Player.Character:FindFirstChild("Head")
            if playerHead then
                local chests = {
                    "ultraNinjitsuChest", "mythicalChest", "goldenChest", "enchantedChest",
                    "magmaChest", "legendsChest", "saharaChest", "eternalChest",
                    "ancientChest", "midnightShadowChest", "wonderChest", "goldenZenChest",
                    "skystormMastersChest", "chaosLegendsChest", "soulFusionChest"
                }
                
                for _, chestName in ipairs(chests) do
                    local chest = game:GetService("Workspace"):FindFirstChild(chestName)
                    if chest and chest:FindFirstChild("circleInner") then
                        for _, v in pairs(chest.circleInner:GetDescendants()) do
                            if v.Name == "TouchInterest" and v.Parent then
                                firetouchinterest(playerHead, v.Parent, 0)
                                wait()
                                firetouchinterest(playerHead, v.Parent, 1)
                            end
                        end
                    end
                end
            end
            wait()
        end
    end},