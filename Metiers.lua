-- Métiers Page for AltCurrencyTracker
local professions = {
    { name = "Alchemy", icon = "Interface\\Icons\\Trade_Alchemy" },
    { name = "Blacksmithing", icon = "Interface\\Icons\\Trade_BlackSmithing" },
    { name = "Enchanting", icon = "Interface\\Icons\\Trade_Engraving" },
    { name = "Engineering", icon = "Interface\\Icons\\Trade_Engineering" },
    { name = "Herbalism", icon = "Interface\\Icons\\Trade_Herbalism" },
    { name = "Inscription", icon = "Interface\\Icons\\INV_Inscription_Tradeskill01" },
    { name = "Jewelcrafting", icon = "Interface\\Icons\\Trade_Jewelcrafting" },
    { name = "Leatherworking", icon = "Interface\\Icons\\Trade_LeatherWorking" },
    { name = "Mining", icon = "Interface\\Icons\\Trade_Mining" },
    { name = "Skinning", icon = "Interface\\Icons\\INV_Misc_Pelt_Wolf_01" },
    { name = "Tailoring", icon = "Interface\\Icons\\Trade_Tailoring" },
    { name = "Cooking", icon = "Interface\\Icons\\INV_Misc_Food_15" },
    { name = "Fishing", icon = "Interface\\Icons\\Trade_Fishing" },
    { name = "Archaeology", icon = "Interface\\Icons\\TRADE_ARCHAEOLOGY" }
}

local mainFrame = CreateFrame("Frame", "ACTProfessionsFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(360, 360)
mainFrame:SetPoint("CENTER")
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("CENTER", mainFrame.TitleBg, "CENTER", 0, 0)
mainFrame.title:SetText("Métiers")
mainFrame:Hide()

local detailFrame = CreateFrame("Frame", "ACTProfessionDetailFrame", UIParent, "BasicFrameTemplateWithInset")
detailFrame:SetSize(200, 100)
detailFrame:SetPoint("CENTER")
detailFrame.title = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
detailFrame.title:SetPoint("CENTER", detailFrame.TitleBg, "CENTER", 0, 0)
detailFrame:Hide()

local detailText = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
detailText:SetPoint("CENTER", detailFrame, "CENTER", 0, 0)

local backButton = CreateFrame("Button", nil, detailFrame, "UIPanelButtonTemplate")
backButton:SetSize(80, 22)
backButton:SetPoint("BOTTOM", detailFrame, "BOTTOM", 0, 10)
backButton:SetText("Retour")
backButton:SetScript("OnClick", function()
    detailFrame:Hide()
    mainFrame:Show()
end)

local function ShowProfessionDetail(prof)
    detailFrame.title:SetText(prof.name)
    detailText:SetText(prof.name)
    mainFrame:Hide()
    detailFrame:Show()
end

local cols = 3
local cardWidth, cardHeight = 80, 80
for i, prof in ipairs(professions) do
    local btn = CreateFrame("Button", nil, mainFrame)
    btn:SetSize(cardWidth, cardHeight)
    local row = math.floor((i - 1) / cols)
    local col = (i - 1) % cols
    btn:SetPoint("TOPLEFT", 15 + col * (cardWidth + 15), -40 - row * (cardHeight + 15))

    local icon = btn:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(64, 64)
    icon:SetPoint("TOP", btn, "TOP", 0, -5)
    icon:SetTexture(prof.icon)

    local fs = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fs:SetPoint("TOP", icon, "BOTTOM", 0, -2)
    fs:SetText(prof.name)

    btn:SetScript("OnClick", function()
        ShowProfessionDetail(prof)
    end)
end

SLASH_ACTPROFESSIONS1 = "/metiers"
SlashCmdList.ACTPROFESSIONS = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        detailFrame:Hide()
        mainFrame:Show()
    end
end
