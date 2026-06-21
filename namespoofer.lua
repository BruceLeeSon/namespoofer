-- // Target Spoofer v9.6 — Premium UI + Dropdown + No Flicker (Oftimized)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Создание интерфейса
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "TargetSpoofer_v9_6"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 440)
Frame.Position = UDim2.new(0.5, -210, 0.5, -220)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Frame

local FrameGradient = Instance.new("UIGradient")
FrameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 18))
}
FrameGradient.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 0, 50)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Target Spoofer"
Title.TextColor3 = Color3.fromRGB(240, 240, 245)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local HideBtn = Instance.new("TextButton")
HideBtn.Size = UDim2.new(0, 32, 0, 32)
HideBtn.Position = UDim2.new(1, -75, 0, 9)
HideBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
HideBtn.Text = "─"
HideBtn.TextColor3 = Color3.fromRGB(200, 200, 205)
HideBtn.Font = Enum.Font.GothamBold
HideBtn.TextSize = 14
HideBtn.Parent = Frame

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 8)
HideCorner.Parent = HideBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -38, 0, 9)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 70)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local DropdownBtn = Instance.new("TextButton")
DropdownBtn.Size = UDim2.new(0.9, 0, 0, 42)
DropdownBtn.Position = UDim2.new(0.05, 0, 0, 65)
DropdownBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
DropdownBtn.Text = " Выберите игрока из сети ▼"
DropdownBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
DropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
DropdownBtn.Font = Enum.Font.GothamMedium
DropdownBtn.TextSize = 14
DropdownBtn.Parent = Frame

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 8)
DropdownCorner.Parent = DropdownBtn

local DropdownList = Instance.new("ScrollingFrame")
DropdownList.Size = UDim2.new(1, 0, 0, 0)
DropdownList.Position = UDim2.new(0, 0, 1, 5)
DropdownList.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
DropdownList.BorderSizePixel = 0
DropdownList.ScrollBarThickness = 4
DropdownList.Visible = false
DropdownList.ZIndex = 5
DropdownList.Parent = DropdownBtn

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 8)
ListCorner.Parent = DropdownList

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 2)
ListLayout.Parent = DropdownList

local FakeUserBox = Instance.new("TextBox")
FakeUserBox.Size = UDim2.new(0.9, 0, 0, 42)
FakeUserBox.Position = UDim2.new(0.05, 0, 0, 122)
FakeUserBox.Text = "ponponpon"
FakeUserBox.PlaceholderText = "Новый ник (@username)"
FakeUserBox.TextColor3 = Color3.new(1, 1, 1)
FakeUserBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
FakeUserBox.Font = Enum.Font.Gotham
FakeUserBox.TextSize = 14
FakeUserBox.Parent = Frame

local FakeUserCorner = Instance.new("UICorner")
FakeUserCorner.CornerRadius = UDim.new(0, 8)
FakeUserCorner.Parent = FakeUserBox

local FakeDisplayBox = Instance.new("TextBox")
FakeDisplayBox.Size = UDim2.new(0.9, 0, 0, 42)
FakeDisplayBox.Position = UDim2.new(0.05, 0, 0, 179)
FakeDisplayBox.Text = "ItchyBalls"
FakeDisplayBox.PlaceholderText = "Новое отображаемое имя (Display)"
FakeDisplayBox.TextColor3 = Color3.new(1, 1, 1)
FakeDisplayBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
FakeDisplayBox.Font = Enum.Font.Gotham
FakeDisplayBox.TextSize = 14
FakeDisplayBox.Parent = Frame

local FakeDisplayCorner = Instance.new("UICorner")
FakeDisplayCorner.CornerRadius = UDim.new(0, 8)
FakeDisplayCorner.Parent = FakeDisplayBox

local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.9, 0, 0, 48)
StartBtn.Position = UDim2.new(0.05, 0, 0, 245)
StartBtn.BackgroundColor3 = Color3.fromRGB(40, 165, 100)
StartBtn.Text = "🚀 ЗАПУСТИТЬ СПУФ"
StartBtn.TextColor3 = Color3.new(1, 1, 1)
StartBtn.Font = Enum.Font.GothamBold
StartBtn.TextSize = 15
StartBtn.Parent = Frame

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 8)
StartCorner.Parent = StartBtn

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0.9, 0, 0, 100)
Status.Position = UDim2.new(0.05, 0, 0, 315)
Status.BackgroundTransparency = 1
Status.Text = "Система готова\n[Правый Ctrl чтобы спрятать меню]"
Status.TextColor3 = Color3.fromRGB(140, 140, 155)
Status.TextSize = 14
Status.Font = Enum.Font.GothamMedium
Status.Parent = Frame

local panelCollapsed = false
local dropdownOpen = false
local selectedTarget = ""
local connections = {}
local active = false

local function toggleDropdown()
    dropdownOpen = not dropdownOpen
    if dropdownOpen then
        for _, obj in pairs(DropdownList:GetChildren()) do
            if obj:IsA("TextButton") then obj:Destroy() end
        end
        local playersList = Players:GetPlayers()
        DropdownList.CanvasSize = UDim2.new(0, 0, 0, #playersList * 32)
        for _, p in pairs(playersList) do
            local pBtn = Instance.new("TextButton")
            pBtn.Size = UDim2.new(1, 0, 0, 30)
            pBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            pBtn.BorderSizePixel = 0
            pBtn.Text = "  " .. p.Name .. " (" .. p.DisplayName .. ")"
            pBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
            pBtn.TextXAlignment = Enum.TextXAlignment.Left
            pBtn.Font = Enum.Font.Gotham
            pBtn.TextSize = 13
            pBtn.ZIndex = 6
            pBtn.Parent = DropdownList
            pBtn.MouseButton1Click:Connect(function()
                selectedTarget = p.Name
                DropdownBtn.Text = " Цель: " .. p.Name
                DropdownBtn.TextColor3 = Color3.fromRGB(240, 240, 245)
                toggleDropdown()
            end)
        end
        DropdownList.Visible = true
        TweenService:Create(DropdownList, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 140)}):Play()
    else
        local t = TweenService:Create(DropdownList, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)})
        t:Play()
        t.Completed:Connect(function() if not dropdownOpen then DropdownList.Visible = false end end)
    end
end

DropdownBtn.MouseButton1Click:Connect(toggleDropdown)

HideBtn.MouseButton1Click:Connect(function()
    panelCollapsed = not panelCollapsed
    TweenService:Create(Frame, TweenInfo.new(0.2), {Size = panelCollapsed and UDim2.new(0, 420, 0, 50) or UDim2.new(0, 420, 0, 440)}):Play()
    HideBtn.Text = panelCollapsed and "┼" or "─"
    DropdownBtn.Visible = not panelCollapsed
    FakeUserBox.Visible = not panelCollapsed
    FakeDisplayBox.Visible = not panelCollapsed
    StartBtn.Visible = not panelCollapsed
    Status.Visible = not panelCollapsed
    if dropdownOpen then toggleDropdown() end
end)

local function clearConnections()
    active = false
    for _, c in pairs(connections) do 
        if typeof(c) == "RBXScriptConnection" then c:Disconnect() 
        elseif typeof(c) == "thread" then task.cancel(c) end
    end
    connections = {}
end

CloseBtn.MouseButton1Click:Connect(function()
    clearConnections()
    ScreenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

local function checkAndModifyText(obj, targetName, targetDisplay, fakeUser, fakeDisplay)
    if not obj:IsA("TextLabel") and not obj:IsA("TextButton") then return end
    local text = obj.Text
    if text == "" then return end

    if text == targetName then
        obj.Text = fakeUser
    elseif string.find(text, targetName) then
        obj.Text = text:gsub(targetName, fakeUser)
    end

    if targetDisplay and targetDisplay ~= "" then
        if text == targetDisplay then
            obj.Text = fakeDisplay
        elseif string.find(text, targetDisplay) then
            obj.Text = text:gsub(targetDisplay, fakeDisplay)
        end
    end
end

local function runSpoofer(targetName, fakeUser, fakeDisplay)
    clearConnections()
    active = true

    local targetPlayer = Players:FindFirstChild(targetName)
    local targetDisplay = targetPlayer and targetPlayer.DisplayName or nil

    if hookmetamethod then
        local oldIndex
        oldIndex = hookmetamethod(game, "__index", function(self, key)
            if active and targetPlayer and self == targetPlayer then
                if key == "Name" then return fakeUser end
                if key == "DisplayName" then return fakeDisplay end
            end
            return oldIndex(self, key)
        end)
    end

    -- Находим только ветку таба (PlayerList) в CoreGui, чтобы не грузить процессор
    local coreGui = game:GetService("CoreGui")
    local playerList = coreGui:FindFirstChild("PlayerList") or coreGui

    -- Комбинированный метод: быстрый точечный кадр (только для Таба) + событийный для остальной игры
    local fastTabLoop = RunService.RenderStepped:Connect(function()
        if not active then return end
        pcall(function()
            -- Быстро сканируем исключительно PlayerList (мигания не будет, FPS высокий)
            for _, obj in pairs(playerList:GetDescendants()) do
                checkAndModifyText(obj, targetName, targetDisplay, fakeUser, fakeDisplay)
            end
            
            -- Принудительный ник над головой персонажа
            if targetPlayer and targetPlayer.Character then
                local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.DisplayName ~= fakeDisplay then
                    humanoid.DisplayName = fakeDisplay
                end
            end
        end)
    end)
    table.insert(connections, fastTabLoop)

    -- Для PlayerGui и Workspace используем легкие ивенты (0% нагрузки)
    local safeContainers = {workspace, Players.LocalPlayer:FindFirstChild("PlayerGui")}
    for _, container in pairs(safeContainers) do
        if container then
            -- Первичный проход
            for _, obj in pairs(container:GetDescendants()) do
                pcall(function() checkAndModifyText(obj, targetName, targetDisplay, fakeUser, fakeDisplay) end)
            end
            -- Отслеживание обновлений
            local dConn = container.DescendantAdded:Connect(function(obj)
                task.wait()
                pcall(function() checkAndModifyText(obj, targetName, targetDisplay, fakeUser, fakeDisplay) end)
            end)
            table.insert(connections, dConn)
        end
    end
end

StartBtn.MouseButton1Click:Connect(function()
    local fakeUser = FakeUserBox.Text
    local fakeDisplay = FakeDisplayBox.Text

    if selectedTarget == "" or fakeUser == "" then 
        Status.Text = "❌ Сначала выберите игрока из списка!"
        Status.TextColor3 = Color3.fromRGB(220, 50, 70)
        return 
    end

    runSpoofer(selectedTarget, fakeUser, fakeDisplay)

    Status.Text = "🟢 Спуф запущен!\nЦель: " .. selectedTarget .. "\nМигание убрано, FPS стабилен."
    Status.TextColor3 = Color3.fromRGB(40, 180, 110)
end)

print("✅ Target Spoofer v9.6 loaded.")