RegisterNetEvent("redrum:didnotmakethis")
AddEventHandler("redrum:didnotmakethis", function()
    TriggerClientEvent('redrum:didnotmakethis-c', -1, source)
end)