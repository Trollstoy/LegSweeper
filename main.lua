print('Hello World')

local Cooldowns = {
}

local Congrats_EventFrame = CreateFrame("Frame")
Congrats_EventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
Congrats_EventFrame:SetScript("OnEvent",
  function(self, event, ...)
    local arg1, arg2, arg3, arg4, arg5 = ...
    -- for key, value in pairs(Cooldowns) do
    --   print(key, value)
    -- end

    key = arg1 .. ': ' .. arg2

    if Cooldowns[key] then
      delta = math.floor(GetTime() - Cooldowns[key])
      print("Time sinse last cast of " .. key .. ": " .. delta)
    end
    Cooldowns[key] = GetTime()
  end
)
