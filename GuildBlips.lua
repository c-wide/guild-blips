local _, addon_data = ...

addon_data.frames = {}
addon_data.frames.event_frame = CreateFrame("Frame", "GuildBlipsEventFrame", UIParent)

local function OnLoad()
    C_ChatInfo.RegisterAddonMessagePrefix("GuildBlips")
    addon_data.frames.event_frame:RegisterEvent("CHAT_MSG_ADDON")
end

local function OnEvent(_, event, ...)
    local args = {...}
    if event == "ADDON_LOADED" and args[1] == "GuildBlips" then
        OnLoad()
    elseif event == "CHAT_MSG_ADDON" and args[1] == "GuildBlips" then
        -- parse message and save data
    end
end

SLASH_GUILDBLIPS_SETTINGS1 = "/GuildBlips"
SLASH_GUILDBLIPS_SETTINGS2 = "/guildblips"
SLASH_GUILDBLIPS_SETTINGS3 = "/gb"
SlashCmdList["GUILDBLIPS_SETTINGS"] = function()
    Settings.OpenToCategory("GuildBlips")
end

addon_data.frames.event_frame:RegisterEvent("ADDON_LOADED")
addon_data.frames.event_frame:SetScript("OnEvent", OnEvent)