key_to_teleport = 38

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]
    --{{1867.42, 3666.11, 32.80, 0}, {1863.09, 3673.94, 33.1, 0},{36,237,157}, "First Teleport"}, -- Outside the Sheriff's Station
    --{{1860.72, 3661.49, 33.00, 0}, {1855.02, 3673.86, 33.3, 0},{255, 157, 0}, "Testing 2nd Teleport"},
    --{{2806.18, 5979.07, 350.7, 0}, {1035.94,-3205.76,-31.1701, 0},{255, 157, 0}, "weed"},
    --{{895.94, -896.24, 27.8, 0}, {1004.7,	-3200.24,-39.9901, 0},{255, 157, 0}, "meth"},
    --{{748.77, -528.93, 27.78, 0}, {98.0,-1290.48,29.27, 0},{255, 157, 0}, "opium"},
    --{{-636.78, -2429.66, 13.94, 0}, {1100.61,-3194.43,-39.9901, 0},{255, 157, 0}, "coke"},
    {{-1267.32, -3046.22, -49.49, 0}, {-1044.56, -2749.98, 21.36, 328.65},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 來回到機場"},
    {{331.41, -592.28, 42.28, 0}, {342.89, -584.72, 73.17, 0},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 搭到頂樓"},
    {{339.89, -584.72, 73.17, 0}, {332.52, -589.32, 43.28, 0},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 搭到2樓"},
    {{336.02, -580.18, 42.29, 0}, {334.8, -583.26, 27.79, 0},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 搭到1樓"},
    {{336.1, -580.73, 27.79, 0}, {334.8, -583.26, 43.28, 0},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 搭到2樓"},
    {{210.05, -1990.27, 18.72, 0}, {999.56, -3158.11, -38.91, 0},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 進到工作坊"},
    {{998.01, -3158.14, -39.92, 0}, {210.05, -1990.27, 18.72, 0},{255, 157, 0}, "按下 ~INPUT_CONTEXT~ 出去工作坊"},
	{{1086.83, -2400.12, 29.18, 0}, {1015.34, -2532.71, 2.83, 0},{0, 0, 0}, "按下 ~INPUT_CONTEXT~ 進到工作坊"},
    {{1015.34, -2532.71, 1.83, 0}, {1086.83, -2400.12, 30.58, 0},{0, 0, 0}, "按下 ~INPUT_CONTEXT~ 出去工作坊"},
    {{1765.66, 2613.71, 49.20, 0}, {1782.47, 2608.94, 45.56, 0},{0, 0, 0}, "按下 ~INPUT_CONTEXT~ 爬入通風管"},
    {{1782.47, 2608.94, 43.90, 0}, {1765.66, 2613.71, 50.55, 0},{0, 0, 0}, "按下 ~INPUT_CONTEXT~ 爬入通風管"},
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.5, Red, Green, Blue, 200, 0, 0, 0, 0)
            --DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            --[[elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end--]]
            end           
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end