
local Juliet = JulietFrame

-- initial adds



function Juliet:AddSetupOnLoad()
  self:AddCallback("ADDON_LOADED", "SETUP_ON_LOAD",
    function()
      self:RemoveEvent('ADDON_LOADED')
      JulietsMemory = JulietsMemory or {} --use stored variable for memory if exists, otherwise create new table for her memory
    end
  )
end

function Juliet:AddSetupOnLogin()
  self:AddCallback("PLAYER_LOGIN", "SETUP_ON_LOGIN",
    function()
        self:RegisterEvent('PLAYER_DEAD')
    end
  )
end

function Juliet:AddGreeting()
  self:AddCallback("PLAYER_LOGIN", "LOGIN_GREETING",
    function()
      print("Juliet: Hi, how are you?")
    end
  )    
end

function Juliet:AddPopUpsOnDeath()
  self:AddCallback("PLAYER_DEAD", "POPUPS_ON_DEATH",
    function()
      StaticPopup_Show("JULIET_AUTO_ACCEPT_RESURRECT")
      StaticPopup_Show("JULIET_AUTO_RELEASE_SPIRIT")
    end
  )
end


function Juliet:AddAutoAcceptResurrect()
  self:AddCallback("CORPSE_IN_RANGE", "AUTO_ACCEPT_RESSURRECT", 
    function()
      local queue = {}
      queue["time"] = GetTime()
      queue["dTime"] = 0.5
      queue["func"] = function() RetrieveCorpse() end
      Juliet_FunctionQueue["RETRIEVE_CORPSE"] = queue 
    end
  )
end

function Juliet:AddAutoReleaseSpirit()
  self:AddCallback("PLAYER_DEAD", "AUTO_RELEASE_SPIRIT", RepopMe)
end



Juliet:AddSetupOnLoad()
Juliet:AddSetupOnLogin()
Juliet:AddGreeting()
Juliet:AddPopUpsOnDeath()