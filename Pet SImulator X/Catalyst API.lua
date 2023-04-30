--[[
    -- // Checklist \\ --
    Network Remotes done
    BypassAC done
    LibraryGame done
]]

local CatalystAPI = {}

CatalystAPI.LibraryGame = require(game:GetService("ReplicatedStorage").Library)

CatalystAPI.Network = {
    get_coins = function()
        local CoinTable = {}
        for i,v in next, game:GetService("Workspace")["__THINGS"].Coins:GetChildren() do
            CoinTable[v] = {
                n = v:GetAttribute("Name")
                a = v:GetAttribute("Area")
                h = v:GetAttribute("Health")
                l = v:GetAttribute("HasLanded")
                i = v:GetAttribute("IsFalling")
                f = v:GetAttribute("Frame")
                m = v:GetAttribute("ModelStage")
                id = v:GetAttribute("ID")
            }
        end
        return CoinTable
    end,
    farm_coin = "Farm Coin",
    change_pet_target = "Change Pet Target",
    claim_orbs = "Claim Orbs",
    join_coin = "Join Coin",
    buy_egg = "Buy Egg"
}

CatalystAPI.BypassAC = function()
    local BlunderList = require(game:GetService("ReplicatedStorage"):FindFirstChild("BlunderList", true))
    local OldGetAndClear = BlunderList.getAndClear
    setreadonly(BlunderList, false)
    BlunderList.getAndClear = function(...)
        local Args = ...
        for i,v in pairs(Args.list) do
            if v.message ~= "PING" then
                table.remove(Args.list, i)
            end
        end
        return OldGetAndClear(Args)
    end
end

return CatalystAPI
