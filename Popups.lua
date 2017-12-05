
local function AddCallback(eventName,name,func)
  JulietFrame:RegisterEvent(eventName) 
  local event = Juliet_Callbacks[eventName] or {}
  event[name] = function() func() end;
  Juliet_Callbacks[eventName] = event
end



function JulietFrame:EnableAutoAcceptResurrect()
  AddCallback("CORPSE_IN_RANGE", "AUTO_ACCEPT_RESSURRECT", 
    function()
      local queue = {}
      queue["time"] = GetTime()
      queue["dTime"] = 0.5
      queue["func"] = function() RetrieveCorpse() end
      Juliet_FunctionQueue["RETRIEVE_CORPSE"] = queue 
    end
  )
end

function JulietFrame:EnableAutoReleaseSpirit()
  AddCallback("PLAYER_DEAD", "AUTO_RELEASE_SPIRIT", RepopMe)
end


StaticPopupDialogs["JULIET_AUTO_ACCEPT_RESURRECT"] = {
  text = "Would you like me to automatically accept your resurrection?",
  button1 = "Yes",
  button2 = "No",
  OnAccept = function()
      JulietFrame:EnableAutoAcceptResurrect()
  end,
  timeout = 10000,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3, 
}

StaticPopupDialogs["JULIET_AUTO_RELEASE_SPIRIT"] = {
  text = "Would you like me to automatically release your spirit?",
  button1 = "Yes",
  button2 = "No",
  OnAccept = function()
      JulietFrame:EnableAutoReleaseSpirit()
  end,
  timeout = 10000,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3, 
}


