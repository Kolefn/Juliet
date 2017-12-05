
local Juliet = JulietFrame


-- ====== ROOT CALLBACKS =======

function Juliet:ADDON_LOADED()
  Juliet:FireCallbacks("ADDON_LOADED")
end

function Juliet:PLAYER_LOGIN()
  Juliet:FireCallbacks("PLAYER_LOGIN")
end



function Juliet:PLAYER_DEAD()
	Juliet:FireCallbacks("PLAYER_DEAD")
end


function Juliet:CORPSE_IN_RANGE()
	 Juliet:FireCallbacks("CORPSE_IN_RANGE") 
end











