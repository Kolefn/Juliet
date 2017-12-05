

local Juliet = CreateFrame('Frame','JulietFrame');  --create the basic juliet frame
Juliet_FunctionQueue = {} -- for functions that need to be called after certain time
Juliet_Callbacks = {}
Juliet:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end) --set all events
Juliet:RegisterEvent('ADDON_LOADED')
Juliet:RegisterEvent('PLAYER_LOGIN')


-- Cache Loaded 

function Juliet:ADDON_LOADED()
  self:RemoveEvent('ADDON_LOADED')
  JulietsMemory = JulietsMemory or {} --use stored variable for memory if exists, otherwise create new table for her memory
end


-- Server Ready

function Juliet:PLAYER_LOGIN()
  self:RemoveEvent('PLAYER_LOGIN')
  print("Juliet: Hi, how are you?")
  self:SetupEvents()
end


function Juliet:SetupEvents()
  self:RegisterEvent('PLAYER_DEAD') -- for popups
end



function Juliet:RemoveEvent(event)
  self:UnregisterEvent(event)
  self[event] = nil
end


local function DeQueue()
	local t = GetTime()
	for key, value in pairs(Juliet_FunctionQueue) do		--iterate queue

		if (t - value["time"] >= value["dTime"]) then	-- if specified wait time has passed
			value["func"]()				-- call
		end
	end

end

Juliet:SetScript('OnUpdate', DeQueue)

