-- MM2 REMAKE
-- Basic Round System
-- Server Script for Roblox Studio

local Players = game:GetService("Players")

local INTERMISSION = 15
local ROUND_TIME = 120
local MIN_PLAYERS = 2

local roundActive = false

local function setRole(player, role)
    player:SetAttribute("Role", role)
    print(player.Name .. " is " .. role)
end

local function resetPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        setRole(player, "Innocent")

        if player.Character then
            player:LoadCharacter()
        end
    end
end

local function chooseRoles()
    local players = Players:GetPlayers()

    if #players < MIN_PLAYERS then
        return false
    end

    local murdererIndex = math.random(1, #players)
    local sheriffIndex

    repeat
        sheriffIndex = math.random(1, #players)
    until sheriffIndex ~= murdererIndex

    for i, player in ipairs(players) do
        if i == murdererIndex then
            setRole(player, "Murderer")
        elseif i == sheriffIndex then
            setRole(player, "Sheriff")
        else
            setRole(player, "Innocent")
        end
    end

    return true
end

local function checkWinner()
    local murdererAlive = false
    local innocentAlive = false

    for _, player in ipairs(Players:GetPlayers()) do
        local role = player:GetAttribute("Role")

        if player.Character then
            local humanoid =
                player.Character:FindFirstChildOfClass("Humanoid")

            if humanoid and humanoid.Health > 0 then
                if role == "Murderer" then
                    murdererAlive = true
                elseif role == "Sheriff"
                    or role == "Innocent" then
                    innocentAlive = true
                end
            end
        end
    end

    if not murdererAlive then
        return "Innocents"
    end

    if not innocentAlive then
        return "Murderer"
    end

    return nil
end

while true do
    roundActive = false

    print("Waiting for players...")

    repeat
        task.wait(1)
    until #Players:GetPlayers() >= MIN_PLAYERS

    for i = INTERMISSION, 1, -1 do
        print("Round starts in:", i)
        task.wait(1)
    end

    if chooseRoles() then
        roundActive = true

        print("ROUND STARTED!")

        for i = ROUND_TIME, 1, -1 do
            if not roundActive then
                break
            end

            local winner = checkWinner()

            if winner then
                print(winner .. " win!")
                break
            end

            print("Time left:", i)
            task.wait(1)
        end

        roundActive = false

        print("Round ended!")

        task.wait(5)
        resetPlayers()
    end
end
