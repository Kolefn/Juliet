
local Juliet = JulietFrame

StaticPopupDialogs["JULIET_AUTO_ACCEPT_RESURRECT"] = {
  text = "Would you like me to automatically accept your resurrection?",
  button1 = "Yes",
  button2 = "No",
  OnAccept = function()
      Juliet:AddAutoAcceptResurrect()
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
      Juliet:AddAutoReleaseSpirit()
  end,
  timeout = 10000,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3, 
}


