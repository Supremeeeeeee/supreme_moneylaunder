ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    local launder = vector3(-1869.86, 2064.47, 134.50)
    local laundertext = vector3(-1869.86, 2064.65, 135.45)
    while true do
        Wait(0)
        local location = GetEntityCoords(GetPlayerPed(-1))
        local dist = #(location - launder)

        if (dist < 2) then
            DrawMarker(27, launder.x, launder.y, launder.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)
        end
        
        if (dist < 2) then
            ESX.Game.Utils.DrawText3D(laundertext, "Press [~r~E~w~] to launder money", 1, 4)
        end

        if IsControlJustPressed(0, 153) and (dist < 10) then
            exports['mythic_progbar']:Progress({
                name = "unique_action_name",
                duration = 10000,
                label = 'laundering money...',
                useWhileDead = true,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@prop_human_bum_bin@base",
                    anim = "base",
                },
            })
            Citizen.Wait(10000)
            Wait(0)
            if not DoesEntityExist(ped) then
                ped = PlayerPedId()
            end
        
            ClearPedTasks(ped)
            TriggerServerEvent("supreme_moneylaunder:GetCash")
        end
    end
end)
