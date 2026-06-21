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