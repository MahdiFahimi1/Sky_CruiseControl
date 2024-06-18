local datasave = nil


lib.registerMenu({
    id = 'menucruise',
    title = 'Speed Limiter',
    position = 'center',
    onSideScroll = function(selected, scrollIndex, args)
    end,
    onCheck = function(selected, checked, args)
        if checked then
            local playerPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local soratalan = GetEntitySpeed(vehicle) * 3.6
                
            SetEntityMaxSpeed(vehicle, soratalan / 3.6)
        else
            local playerPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local soratalan = GetEntitySpeed(vehicle) * 3.6
                
            SetEntityMaxSpeed(vehicle, 99999 / 3.6)
        end

    end,

    onSelected = function(selected, secondary, args)
        if not secondary then
        else
            if args.isCheck then
            end
 
            if args.isScroll then
            end
        end
        print(checked)
        lib.closeInputDialog()
        local spam = true
        if selected == 2 then
            if spam then
            Citizen.CreateThread(function()
                while true do
                    Wait(0)
            if IsControlJustReleased(0, 191) then
                spam = false
                if selected == 2 then
                    lib.hideMenu(onExit)
                    Wait(500)
                local input = lib.inputDialog('Speed Limiter', {'Set Your Speed Limit'})
                selected = 1
                if not input then return end
                local playerPed = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local soratalan = GetEntitySpeed(vehicle) * 3.6
                checked = true
                SetEntityMaxSpeed(vehicle, input[1] / 3.6)
                Wait(2000)
                selected = 1
                spam = true
            end
            end
        end
        end)
        end
    end
    end,
    onClose = function(keyPressed)
        if keyPressed then
        end
    end,
    options = {
        {label = 'Limit Speed', checked = false},
        {label = 'Custom Limit Speed'},
    }
}, function(selected, scrollIndex, args)
end)

local keybind = lib.addKeybind({
    name = 'Cruise',
    description = 'B - Cruise Control',
    defaultKey = 'B',
    onPressed = function(self)
        local playerPed = PlayerPedId()
        
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local driver = GetPedInVehicleSeat(vehicle, -1)
            
            if driver == playerPed then
                lib.showMenu('menucruise')
            end
        end
    end
})
