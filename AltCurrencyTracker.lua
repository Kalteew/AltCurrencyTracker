local addonName = ...
local db

local locale = GetLocale()
local L = {
    enUS = { other = "Other characters:", total = "Total:" },
    enGB = { other = "Other characters:", total = "Total:" },
    frFR = { other = "Autres personnages :", total = "Total :" },
    deDE = { other = "Andere Charaktere:", total = "Gesamt:" },
    esES = { other = "Otros personajes:", total = "Total:" },
    esMX = { other = "Otros personajes:", total = "Total:" },
    itIT = { other = "Altri personaggi:", total = "Totale:" },
    ptBR = { other = "Outros personagens:", total = "Total:" },
    ruRU = { other = "Другие персонажи:", total = "Всего:" },
    koKR = { other = "다른 캐릭터:", total = "총합:" },
    zhCN = { other = "其他角色：", total = "总计：" },
    zhTW = { other = "其他角色：", total = "總計：" },
}
local OTHER_CHARS_TEXT = (L[locale] and L[locale].other) or L.enUS.other
local TOTAL_TEXT = (L[locale] and L[locale].total) or L.enUS.total

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

local function AddCharCurrencyLinesToTooltip(GameTooltip, id, currentAmount)
    local currentCharKey = GetCharKey()
    local sorted = {}
    local total = currentAmount or 0
    for charKey, data in pairs(db) do
        if charKey ~= currentCharKey and data[id] then
            table.insert(sorted, { name = charKey, amount = data[id] })
            total = total + data[id]
        end
    end

    table.sort(sorted, function(a, b) return a.name < b.name end)

    if #sorted > 0 then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cffffcc00" .. OTHER_CHARS_TEXT .. "|r")
        for _, char in ipairs(sorted) do
            GameTooltip:AddDoubleLine(char.name, char.amount, 1, 1, 1, 1, 1, 1)
        end
        GameTooltip:AddLine(" ")
        GameTooltip:AddDoubleLine(TOTAL_TEXT, total, 1, 1, 1, 1, 1, 1)
    end
end

hooksecurefunc(GameTooltip, "SetCurrencyToken", function(self, index)
    if type(index) ~= "number" then return end

    local name, isHeader, _, _, _, count, _, _, _, _, _, itemID = GetCurrencyListInfo(index)
    if itemID and not isHeader then
        AddCharCurrencyLinesToTooltip(self, itemID, count)
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
        AltCurrencyTrackerDB = AltCurrencyTrackerDB or {}
        db = AltCurrencyTrackerDB
    elseif event == "PLAYER_ENTERING_WORLD" or event == "CURRENCY_DISPLAY_UPDATE" then
        UpdateCurrencies()
    end
end)
