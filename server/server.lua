ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------------------- Nourritures

RegisterNetEvent('buyPain')
AddEventHandler('buyPain', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('bread', 1)
       TriggerClientEvent('esx:showNotification', source, "~y~Vous avez acheté du Pain pour le prix de ~r~"..price.."~s~ $")
    else
        TriggerClientEvent('esx:showNotification', source, "Il vous manque "..price-xMoney.."$")
    end
end)

------------------------------- Boissons

RegisterNetEvent('buyEau')
AddEventHandler('buyEau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('water', 1)
       TriggerClientEvent('esx:showNotification', source, "~b~Vous avez acheté une bouteille d'eau pour le prix de ~r~"..price.."~s~ $")
    else
        TriggerClientEvent('esx:showNotification', source, "Il vous manque "..price-xMoney.."$")
    end
end)