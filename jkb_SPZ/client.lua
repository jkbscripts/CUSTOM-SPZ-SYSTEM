local function SetSilentPlate(vehicle)
    if DoesEntityExist(vehicle) then
        SetVehicleNumberPlateText(vehicle, "JKB Scripts")
    end
end

AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkVehicleSpawned' then
        local vehicle = args[1]
        SetSilentPlate(vehicle)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            SetSilentPlate(veh)
        end
    end
end)
