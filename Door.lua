local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/china-ui/refs/heads/main/main%20(2).lua"))()

if game.PlaceId == 6516141723 then
    WindUI:Notify({
        Title = "请在游戏里执行",
        Content = "检测到在大厅执行脚本", 
        Duration = 2
    })
    return
end

local function gradientText(text, colorA, colorB)
    if type(text) ~= "string" then return text end
    local result = {}
    for i = 1, #text do
        local ratio = (i-1)/(#text-1)
        local r = math.floor(colorA.R + (colorB.R-colorA.R)*ratio * 255)
        local g = math.floor(colorA.G + (colorB.G-colorA.G)*ratio * 255)
        local b = math.floor(colorA.B + (colorB.B-colorA.B)*ratio * 255)
        table.insert(result, string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i,i)))
    end
    return table.concat(result)
end

-- 欢迎弹窗
local Confirmed = false
WindUI:Popup({
    Title = "欢迎使用轻风脚本",
    Icon = "zap",
    IconThemed = true,
    Content = "哪个服务器谁制作的会有标注，哪个服务器有bug就联系哪个作者",
    Buttons = {
        {
            Title = "取消",
            Callback = function() 
                print("用户取消了操作")
            end,
            Variant = "Secondary",
        },
        {
            Title = "继续",
            Icon = "arrow-right",
            Callback = function() 
                Confirmed = true 
            end,
            Variant = "Primary",
        }
    }
})

repeat task.wait() until Confirmed

-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "轻风脚本",
    Icon = "zap",
    IconThemed = true,
    Author = "只要创作者QQ: 2875456271",
    Folder = "AdvancedUI",
    Size = UDim2.fromOffset(450, 350),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() 
            WindUI:Notify({
                Title = "用户信息",
                Content = "清风yyds",
                Duration = 3
            })
        end,
        Anonymous = false
    },
    SideBarWidth = 220,
    ScrollBarEnabled = true
})

local toushiTab = Window:Tab({
    Title = "道具透视",
    Icon = "zap",
    Desc = "Door透视"
})

local gwTab = Window:Tab({
    Title = "怪物透视",
    Icon = "zap",
    Desc = "Door透视"
})

local tsTab = Window:Tab({
    Title = "提示",
    Icon = "zap",
    Desc = "Door提示"
})

-- 修复：为每个提示功能定义独立的连接变量
local rushConnection, eyesConnection, seekConnection, avoidConnection, screechConnection

tsTab:Toggle({
    Title = "Rush提示",
    Desc = "提示1", 
    Value = false,
    Callback = function(value)
        if rushConnection then
            rushConnection:Disconnect()
        end
            
        if value then
            rushConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, b in pairs(workspace:GetDescendants()) do
                    if b:IsA("Model") and b.Name == "RushMoving" then
                        WindUI:Notify({
                            Title = "Rush来了还不快躲柜子",
                            Content = "检测到Rush了",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end
})

tsTab:Toggle({
    Title = "Eyes提示",
    Desc = "提示2", 
    Value = false,
    Callback = function(value)
        if eyesConnection then
            eyesConnection:Disconnect()
        end
            
        if value then
            eyesConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, b in pairs(workspace:GetDescendants()) do
                    if b:IsA("Model") and b.Name == "Eyes" then
                        WindUI:Notify({
                            Title = "Eyes来了别看他",
                            Content = "检测到Eyes了",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end
})

tsTab:Toggle({
    Title = "Seek提示",
    Desc = "提示3", 
    Value = false,
    Callback = function(value)
        if seekConnection then
            seekConnection:Disconnect()
        end
            
        if value then
            seekConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, b in pairs(workspace:GetDescendants()) do
                    if b:IsA("Model") and b.Name == "SeekMovingNewClone" then
                        WindUI:Notify({
                            Title = "seek要出现了噢",
                            Content = "检测到Seek了",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end
})

tsTab:Toggle({
    Title = "绿色海啸提示",
    Desc = "提示4", 
    Value = false,
    Callback = function(value)
        if avoidConnection then
            avoidConnection:Disconnect()
        end
            
        if value then
            avoidConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, b in pairs(workspace:GetDescendants()) do
                    if b:IsA("Model") and b.Name == "AvoidRush" then
                        WindUI:Notify({
                            Title = "绿色海啸来了还不快躲柜子",
                            Content = "检测到绿色海啸了",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end
})

tsTab:Toggle({
    Title = "Screech提示",
    Desc = "提示5", 
    Value = false,
    Callback = function(value)
        if screechConnection then
            screechConnection:Disconnect()
        end
            
        if value then
            screechConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, b in pairs(workspace:GetDescendants()) do
                    if b:IsA("Model") and b.Name == "Screech" then
                        WindUI:Notify({
                            Title = "Screech来了还不快看他",
                            Content = "检测到Screech了",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end
})

toushiTab:Toggle({
    Title = "玩家",
    Desc = "透视1", 
    Value = false,
    Callback = function(value)
        if value then
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    local a = Instance.new("Highlight")
                    a.FillColor = Color3.fromRGB(255, 0, 0)
                    a.OutlineColor = Color3.fromRGB(255, 255, 0)
                    a.FillTransparency = 0.5
                    a.Parent = player.Character
                end
            end
            
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local b = Instance.new("BillboardGui")
                    b.Size = UDim2.new(0, 200, 0, 50)
                    b.StudsOffset = Vector3.new(0, 3, 0)
                    b.Adornee = player.Character.HumanoidRootPart
                    b.AlwaysOnTop = true
                    
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Text = player.Name
                    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    textLabel.TextSize = 14
                    textLabel.Parent = b
                    
                    b.Parent = player.Character.HumanoidRootPart
                end
            end
        end
    end
})

-- 修复：定义connection变量在函数外部
local doorConnection, keyConnection, bookConnection

toushiTab:Toggle({
    Title = "门透视",
    Desc = "透视2", 
    Value = false,
    Callback = function(value)
        if doorConnection then
            doorConnection:Disconnect()
            doorConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanDoors()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "Door" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(255, 0, 0)
                            b.OutlineColor = Color3.fromRGB(255, 255, 0)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            doorConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanDoors()
                end
            end)
           
            doorConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "Door" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(255, 0, 0)
                        c.OutlineColor = Color3.fromRGB(255, 255, 0)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "Door" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

toushiTab:Toggle({
    Title = "钥匙透视",
    Desc = "透视3", 
    Value = false,
    Callback = function(value)
        if keyConnection then
            keyConnection:Disconnect()
            keyConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanKeys()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "KeyObtain" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(255, 255, 0)
                            b.OutlineColor = Color3.fromRGB(255, 255, 0)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            keyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanKeys()
                end
            end)
           
            keyConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "KeyObtain" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(255, 255, 0)
                        c.OutlineColor = Color3.fromRGB(255, 255, 0)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "KeyObtain" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

toushiTab:Toggle({
    Title = "书透视:50关",
    Desc = "透视4", 
    Value = false,
    Callback = function(value)
        if bookConnection then
            bookConnection:Disconnect()
            bookConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanBooks()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "BookChams" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            bookConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanBooks()
                end
            end)
           
            bookConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "BookChams" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "BookChams" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

-- 修复：将guaiwuTab改为怪物Tab以保持一致性
local rushEspConnection, eyesEspConnection, screechEspConnection, fakeDoorConnection, seekEspConnection, avoidEspConnection, figureConnection

gwTab:Toggle({
    Title = "Rush透视",
    Desc = "透视1", 
    Value = false,
    Callback = function(value)
        if rushEspConnection then
            rushEspConnection:Disconnect()
            rushEspConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanRush()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "RushMoving" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            rushEspConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanRush()
                end
            end)
           
            rushEspConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "RushMoving" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "RushMoving" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

gwTab:Toggle({
    Title = "Eyes透视",
    Desc = "透视2", 
    Value = false,
    Callback = function(value)
        if eyesEspConnection then
            eyesEspConnection:Disconnect()
            eyesEspConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanEyes()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "Eyes" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            eyesEspConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanEyes()
                end
            end)
           
            eyesEspConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "Eyes" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "Eyes" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

gwTab:Toggle({
    Title = "Screech透视",
    Desc = "透视3", 
    Value = false,
    Callback = function(value)
        if screechEspConnection then
            screechEspConnection:Disconnect()
            screechEspConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanScreech()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "Screech" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            screechEspConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanScreech()
                end
            end)
           
            screechEspConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "Screech" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "Screech" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

gwTab:Toggle({
    Title = "假门透视",
    Desc = "透视4", 
    Value = false,
    Callback = function(value)
        if fakeDoorConnection then
            fakeDoorConnection:Disconnect()
            fakeDoorConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanFakeDoors()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "Sideroom_HotelRoom1_Mirrored" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            fakeDoorConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanFakeDoors()
                end
            end)
           
            fakeDoorConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "Sideroom_HotelRoom1_Mirrored" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "Sideroom_HotelRoom1_Mirrored" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

gwTab:Toggle({
    Title = "Seek透视",
    Desc = "透视5", 
    Value = false,
    Callback = function(value)
        if seekEspConnection then
            seekEspConnection:Disconnect()
            seekEspConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanSeek()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "SeekMovingNewClone" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            seekEspConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanSeek()
                end
            end)
           
            seekEspConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "SeekMovingNewClone" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "SeekMovingNewClone" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

gwTab:Toggle({
    Title = "绿色海啸透视",
    Desc = "透视6", 
    Value = false,
    Callback = function(value)
        if avoidEspConnection then
            avoidEspConnection:Disconnect()
            avoidEspConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanAvoid()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "AvoidRush" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            avoidEspConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanAvoid()
                end
            end)
           
            avoidEspConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "AvoidRush" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "AvoidRush" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})

gwTab:Toggle({
    Title = "50关怪物透视",
    Desc = "透视7", 
    Value = false,
    Callback = function(value)
        if figureConnection then
            figureConnection:Disconnect()
            figureConnection = nil
        end
            
        if value then
            local espEnabled = true
            
            local function scanFigure()
                for _, a in pairs(workspace:GetDescendants()) do
                    if a:IsA("Model") and a.Name == "FigureChams" then
                        if not a:FindFirstChildOfClass("Highlight") then
                            local b = Instance.new("Highlight")
                            b.FillColor = Color3.fromRGB(50, 50, 255)
                            b.OutlineColor = Color3.fromRGB(0, 0, 255)
                            b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            b.FillTransparency = 0.6
                            b.Parent = a
                        end
                    end
                end
            end
            
            figureConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if espEnabled then
                    scanFigure()
                end
            end)
           
            figureConnection = workspace.ChildAdded:Connect(function(newkey)
                if espEnabled and newkey:IsA("Model") and newkey.Name == "FigureChams" then
                    if not newkey:FindFirstChildOfClass("Highlight") then
                        local c = Instance.new("Highlight")
                        c.FillColor = Color3.fromRGB(50, 50, 255)
                        c.OutlineColor = Color3.fromRGB(0, 0, 255)
                        c.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        c.FillTransparency = 0.6
                        c.Parent = newkey
                    end
                end
            end)
            
        else
            for _, a in pairs(workspace:GetDescendants()) do
                if a:IsA("Model") and a.Name == "FigureChams" then
                    local key = a:FindFirstChildOfClass("Highlight")
                    if key then
                        key:Destroy()
                    end
                end
            end
        end
    end
})