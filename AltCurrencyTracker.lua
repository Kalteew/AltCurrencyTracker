local addonName = ...
local db

local function GetCharKey()
    local name, realm = UnitFullName("player")
    if not name or not realm then return nil end
    return realm .. " - " .. name
end

local function UpdateCurrencies()
    local charKey = GetCharKey()
    if not charKey then return end

    local size = GetCurrencyListSize()
    db[charKey] = db[charKey] or {}

    for i = 1, size do
        local name, isHeader, _, _, _, count, _, _, _, _, _, itemID = GetCurrencyListInfo(i)
        if not isHeader and itemID then
            db[charKey][itemID] = count or 0
        end
    end
end

local function AddCharCurrencyLinesToTooltip(GameTooltip, id)
    local currentCharKey = GetCharKey()
    local sorted = {}
    for charKey, data in pairs(db) do
        if charKey ~= currentCharKey and data[id] then
            table.insert(sorted, { name = charKey, amount = data[id] })
        end
    end

    table.sort(sorted, function(a, b) return a.name < b.name end)

    if #sorted > 0 then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cffffcc00Other characters:|r")
        for _, char in ipairs(sorted) do
            GameTooltip:AddDoubleLine(char.name, char.amount, 1, 1, 1, 1, 1, 1)
        end
    end
end

hooksecurefunc(GameTooltip, "SetCurrencyToken", function(self, index)
    if type(index) ~= "number" then return end

    local name, isHeader, _, _, _, count, _, _, _, _, _, itemID = GetCurrencyListInfo(index)
    if itemID and not isHeader then
        AddCharCurrencyLinesToTooltip(self, itemID)
        self:Show()
    end
end)


-- Events
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
f:RegisterEvent("PLAYER_ENTERING_WORLD")

f:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        MyCurrenciesDB = MyCurrenciesDB or {}
        db = MyCurrenciesDB
    elseif event == "PLAYER_ENTERING_WORLD" or event == "CURRENCY_DISPLAY_UPDATE" then
        UpdateCurrencies()
    end
end)
