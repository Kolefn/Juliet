

local Juliet = CreateFrame('Frame','JulietFrame');  --create the basic juliet frame
Juliet:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end) --set all events
Juliet_FunctionQueue = {} -- for functions that need to be called after certain time
Juliet_Callbacks = {} -- store all callbacks in this table

function Juliet:RemoveEvent(event)
  self:UnregisterEvent(event)
  self[event] = nil
end

function Juliet:AddCallback(eventName,name,func)
  self:RegisterEvent(eventName) 
  local event = Juliet_Callbacks[eventName] or {}
  event[name] = function() func() end;
  Juliet_Callbacks[eventName] = event
end

function Juliet:FireCallbacks(event)
	local none = true
	local callbacks = Juliet_Callbacks[event] or {}
	for name,callback in pairs(callbacks) do
		none = false
		callback() 
	end
	if (none) then					-- if nothing is to be done after an event, remove it
		self:UnregisterEvent(event)
	end
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

