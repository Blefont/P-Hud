local streetName = ""

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)


        local street1, street2 = GetStreetNameAtCoord(playerPos.x, playerPos.y, playerPos.z)


        if street1 ~= 0 then
            streetName = GetStreetNameFromHashKey(street1)


            SendNUIMessage({
                action = "updateStreetName", 
                street = streetName  
            })
        else

            SendNUIMessage({
                action = "updateStreetName",  
                street = "Inconnue" 
            })
        end
    end
end)

RegisterCommand("toggleHUD", function()
    SetDisplay(true)
end, false)

function SetDisplay(state)
    if state then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "show"
        })
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "hide"
        })
    end
end
