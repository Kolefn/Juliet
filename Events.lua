
local function FireCallbacks(event)
	local none = true
	local callbacks = Juliet_Callbacks[event] or {}
	for name,callback in pairs(callbacks) do
		none = false
		callback() 
	end
	if (none) then					-- if nothing is to be done after an event, remove it
		JulietFrame:UnregisterEvent(event)
	end
end

-- ====== EVENTS =======

function JulietFrame:PLAYER_DEAD()
	FireCallbacks("PLAYER_DEAD")
	StaticPopup_Show("JULIET_AUTO_ACCEPT_RESURRECT")
	StaticPopup_Show("JULIET_AUTO_RELEASE_SPIRIT")
end


function JulietFrame:CORPSE_IN_RANGE()
	FireCallbacks("CORPSE_IN_RANGE") 
end











