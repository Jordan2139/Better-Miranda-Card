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

    TriggerEvent('vcard:display', true)
    TriggerEvent('anima', true)
    local closest = Closetplayer()

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