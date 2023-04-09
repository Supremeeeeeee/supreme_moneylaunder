ESX = exports["es_extended"]:getSharedObject()

local locations = {
    vector3(951.527,5.397,110.283)
    --vector3(851.527,3.397,90.283)
    --vector3(751.527,2.397,56.283)
    --vector3(651.527,1.397,90.283)
}


Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(locations) do
        local launder = vector3(v.x,v.y,v.z)
        local location = GetEntityCoords(GetPlayerPed(-1))
        local dist = #(location - launder)

        if (dist < 2) then
            DrawMarker(27, launder.x, launder.y, launder.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)
        end
        
        if (dist < 2) then
            ESX.Game.Utils.DrawText3D(laundertext, "Press [~r~E~w~] to launder money", 1, 4)
        end

        if IsControlJustPressed(0, 153) and (dist < 1) then
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
  end
end)
