-----------------------------------------------------------------------------
-- Better-ID- A Simple FiveM Script, Made By Rocket Development w/ NAT2K15 --
-----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! THERE IS NOTHING TO EDIT --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------

RegisterCommand('mcard', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 120000

    TriggerServerEvent('redrum:didnotmakethis')
    TriggerEvent('mcard:display', true)
    TriggerEvent('anima', true)

    while display do
      Citizen.Wait(1)
      ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
        display = false
        TriggerEvent('mcard:display', false)
      end
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('mcard:display', false)
        StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
      end
    end
  end)
end)
  
  RegisterNetEvent('mcard:display')
  AddEventHandler('mcard:display', function(value)
    SendNUIMessage({
      type = "mcard",
      display = value
    })
  end)
  
  RegisterNetEvent('redrum:didnotmakethis-c')
  AddEventHandler('redrum:didnotmakethis-c', function(id)
    Citizen.CreateThread(function()
    local display = true
    local myid = PlayerId() -- Define my id
    local pid = GetPlayerFromServerId(id) -- Define Jo Shmoes ID
    local startTime = GetGameTimer()
    local delay = 120000
    if pid ~= myid then
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myid)), GetEntityCoords(GetPlayerPed(pid)), true) < 5 then -- If the person is within 25 meters run this
        TriggerEvent('mcard:display', true)
        TriggerEvent('anima', true)    
            while display do
                Citizen.Wait(1)
                ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0)
                if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
                display = false
                TriggerEvent('mcard:display', false)
            end
                if (IsControlJustPressed(1, 51)) then
                    display = false
                    TriggerEvent('mcard:display', false)
                    StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
                  end  
            end          
        else
                TriggerEvent('mcard:display', false)
                display = true    
            end
        end
end)
end)
  
RegisterNetEvent("anima")
AddEventHandler("anima", function(inputText) 
  RequestAnimDict("amb@code_human_wander_clipboard@male@base")
  TaskPlayAnim(GetPlayerPed(-1),"amb@code_human_wander_clipboard@male@base", "static", 5.0, -1, -1, 50, 0, false, false, false)
end)
  
  
function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
  
  
RegisterCommand('vcard', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 120000

    TriggerServerEvent('redrum:didnotmakethiseither')
    TriggerEvent('vcard:display', true)
    TriggerEvent('anima', true)

    while display do
      Citizen.Wait(1)
      ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then 
        display = false
        TriggerEvent('vcard:display', false)
      end
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('vcard:display', false)
        StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
      end
    end
  end)
end)

RegisterNetEvent('redrum:didnotmakethiseither-c')
AddEventHandler('redrum:didnotmakethiseither-c', function(id)
  Citizen.CreateThread(function()
  local display = true
  local myid = PlayerId() -- Define my id
  local pid = GetPlayerFromServerId(id) -- Define Jo Shmoes ID
  local startTime = GetGameTimer()
  local delay = 120000
  if pid ~= myid then
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myid)), GetEntityCoords(GetPlayerPed(pid)), true) < 5 then -- If the person is within 25 meters run this
      TriggerEvent('vcard:display', true)
      TriggerEvent('anima', true)    
          while display do
              Citizen.Wait(1)
              ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0)
              if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
              display = false
              TriggerEvent('vcard:display', false)
          end
              if (IsControlJustPressed(1, 51)) then
                  display = false
                  TriggerEvent('vcard:display', false)
                  StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
                end  
          end          
      else
              TriggerEvent('vcard:display', false)
              display = true    
          end
      end
end)
end)

  
  RegisterNetEvent('vcard:display')
  AddEventHandler('vcard:display', function(value)
    SendNUIMessage({
      type = "vcard",
      display = value
    })
  end)
  
  
  function ShowInfo(text, state)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, state, 0, -1)
  end

--[[
  HOW TO ADD YOUR OWN CARDS/ COMMANDS

  RegisterCommand('vcard', function() -- SIMPLY REGISTER THE COMMANDS
  Citizen.CreateThread(function() -- INITALIZE THE FUNCTION
    local display = true              -- \ 
    local startTime = GetGameTimer()  --  > DON'T ASK WHY, JUST KEEP THESE TRUE
    local delay = 120000              -- / 

    TriggerServerEvent('redrum:didnotmakethiseither') -- CREATE YOUR OWN SERVER EVENT 
    TriggerEvent('vcard:display', true) -- EDIT TO MATCH YOUR EVENT NAME (YOU'LL CREATE THAT SOON)
    TriggerEvent('anima', true) -- SIMPLY KEEP THIS THE WAY IT IS

    while display do -- KEEP THIS
      Citizen.Wait(1) -- MUST HAVE THIS
      ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0) -- YOU CAN EDIT THIS MESSAGE
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then -- THIS HELPS SYNC THE CLIENTS
        display = false -- KEEP THIS
        TriggerEvent('vcard:display', false) -- EDIT TO MATCH YOUR EVENT NAME (YOU'LL CREATE THAT SOON)
      end -- KEEP THIS OR SYNTAX ERROR
      if (IsControlJustPressed(1, 51)) then -- YOU CAN EDIT THIS TO MATCH YOUR LIKING, SEE BUTTON REFERENCE https://docs.fivem.net/docs/game-references/controls/
        display = false -- KEEP THIS
        TriggerEvent('vcard:display', false) -- EDIT TO MATCH YOUR EVENT NAME (YOU'LL CREATE THAT SOON)
        StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0) -- KEEP THIS TO ACTUALLY STOP THE ANIMATION
      end -- KEEP THIS OR SYNTAX ERROR
    end -- KEEP THIS OR SYNTAX ERROR
  end) -- KEEP THIS OR SYNTAX ERROR
end) -- KEEP THIS OR SYNTAX ERROR

RegisterNetEvent('redrum:didnotmakethiseither-c') -- REGISTER YOUR EVENT FROM THE SERVER
AddEventHandler('redrum:didnotmakethiseither-c', function(id) -- ADD AN EVENT HANDLER 
  Citizen.CreateThread(function() -- INITALIZE YOUR FUNCTION
  local display = true -- KEEP THIS
  local myid = PlayerId() -- Define my id
  local pid = GetPlayerFromServerId(id) -- Define Jo Shmoes ID
  local startTime = GetGameTimer() -- KEEP THIS
  local delay = 120000 -- KEEP THIS
  if pid ~= myid then -- IF pid DOES NOT = myid
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myid)), GetEntityCoords(GetPlayerPed(pid)), true) < 5 then -- If the person is within 5 meters run this
      TriggerEvent('vcard:display', true) -- EDIT TO MATCH YOUR EVENT NAME
      TriggerEvent('anima', true) -- KEEP THIS
          while display do -- KEEP THIS
              Citizen.Wait(1) -- NEED THIS
              ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0) -- YOU CAN EDIT THIS TO MATCH YOUR LIKING, SEE BUTTON REFERENCE https://docs.fivem.net/docs/game-references/controls/
              if (GetTimeDifference(GetGameTimer(), startTime) > delay) then -- MAKE SURE CLIENTS ARE SYNCED
              display = false -- KEEP THIS
              TriggerEvent('vcard:display', false) -- EDIT TO MATCH YOUR EVENT 
          end -- NO SYNTAX ERRORS HERE
              if (IsControlJustPressed(1, 51)) then -- YOU CAN EDIT THIS TO MATCH YOUR LIKING, SEE BUTTON REFERENCE https://docs.fivem.net/docs/game-references/controls/
                  display = false -- KEEP THIS
                  TriggerEvent('vcard:display', false) -- EDIT TO MATCH YOUR EVENT
                  StopAnimTask(GetPlayerPed(-1), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0) -- KEEP THIS TO ACTUALLY STOP THE ANIMATION
                end  -- KEEP
          end -- KEEP
      else -- KEEP 
              TriggerEvent('vcard:display', false) -- KEEP
              display = true -- KEEP
          end -- KEEP 
      end -- KEEP
end) -- KEEP
end) -- KEEP

  
  RegisterNetEvent('vcard:display') -- CREATE YOUR EVENT HERE
  AddEventHandler('vcard:display', function(value) -- EDIT YOUR EVENT HERE
    SendNUIMessage({ -- KEEP
      type = "vcard", -- EDIT THIS, MAKE SURE TO EDIT THE UI
      display = value -- KEEP THIS
    }) -- KEEP
  end) -- KEEP
  

]]--