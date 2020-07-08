local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local listOn = false
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    listOn = false
    while true do
        Citizen.Wait(0)

        if IsControlPressed(0, Keys["F10"]) then
            if not listOn then

                ESX.TriggerServerCallback('w1ms_scoreboard:data', function(data)
                ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
                    local ems = 0 
                    local police = 0
                    local taxi = 0
                    local mechanic = 0
                    local player = 0
                    for k,v in pairs(connectedPlayers) do
                        player = player + 1
                        if v.job == 'ambulance' then
                            ems = ems + 1
                        elseif v.job == 'police' then
                            police = police + 1
                        elseif v.job == 'taxi' then
                            taxi = taxi + 1
                        elseif v.job == 'mechanic' then
                            mechanic = mechanic + 1
                        end
                        if police == 0 then
                            police_txt = "無政府"
                        elseif police >= 2 then
                            police_txt = "執勤中"
                        else
                            police_txt = "巡邏中"
                        end
                    end
                
                SendNUIMessage({
                    id = GetPlayerServerId(PlayerId()),
                    name = data[1].name,
                    phone = data[1].phone,
                    job = data[1].job,
                    online = player,
                    ping = data[1].ping,
                    ems = ems,
                    police = police_txt,
                    taxi = taxi,
                    mechanic = mechanic,
                })
                end)
                end)

                listOn = true
                while listOn do
                    Citizen.Wait(0)
                    if(IsControlPressed(0, Keys['F10']) == false) then
                        listOn = false
                        SendNUIMessage({
                            meta = 'close'
                        })
                        break
                    end
                end
            end
        end
    end
end)
