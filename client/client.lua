ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Menus
local shop = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeadeerColor = {0, 0, 0}, Title = "Supérette" },
    Data = { currentMenu = "main" },
    Events = {
        onSelected = function(self, _, btn, JMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "Pain" then
                TriggerServerEvent('buyPain')
            elseif btn.name == "Eau" then
                TriggerServerEvent('buyEau')
            elseif btn.name == "~r~Fermer le menu" then
                CloseMenu(true)
            elseif btn.name == "~y~Nourriture" then
                OpenMenu('Nourriture')
            elseif btn.name == "~b~Boisson" then
                OpenMenu('Boisson')
            end
        end,
    },

    Menu = {
        ["main"] = {
            b = {
                {name = "~y~Nourriture", ask = "→", askX = true},
                {name = "~b~Boisson", ask = "→", askX = true},
                {name = "~r~Fermer le menu", askX = true},
            }
        },
        ["Nourriture"] = {
            b = {
                {name = "Pain", ask = "→", askX = true},
            }
        },
        ["Boisson"] = {
            b = {
                {name = "Eau", ask = "→", askX = true},
            }
        },
    }
}

local pos = {
    {x = 25.74, y = -1346.42, z = 29.48},
    {x = 2557.45, y = 382.28, z = 108.62},
    {x = -3038.93, y = 585.94, z = 7.9},
    {x = -3241.92, y = 10001.46, z = 12.83},
    {x = 547.43, y = 2671.71, z = 42.15},
    {x = 1961.46, y = 3740.67, z = 32.34},
    {x = 2678.91, y = 3280.67, z = 55.24},
    {x = 1729.21, y = 6414.13, z = 35.03},
    {x = 1135.8, y = -982.28, z = 46.41},
    {x = -1222.91, y = -906.98, z = 12.32},
    {x = -1487.553, y = -379.1, z = 40.16},
    {x = -2968.24, y = 390.91, z = 15.04},
    {x = 1166.02, y = 2708.93, z = 38.15},
    {x = 1392.56, y = 3604.68, z = 34.98},
}

-- Ouverture du Menu 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(pos) do

            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= 1.5 then
                ESX.ShowHelpNotification("Appuyez sur [~b~E~s~] pour ouvrir le shop")
                if IsControlJustPressed(1, 38) then
                    Citizen.Wait(200)
                    CreateMenu(shop)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    
    for k in pairs(pos) do

    local blip = AddBlipForCoord(pos[k].x, pos[k].y, pos[k].z) -- remplacer les coordonnés

    SetBlipSprite (blip, 293) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.8) -- Taille du blip
    SetBlipColour (blip, 2) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Divers | Magasin de Nourritures') -- Nom du blips
    EndTextCommandSetBlipName(blip)
    end
end)