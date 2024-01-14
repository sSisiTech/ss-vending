QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ss-vending:checkcash')
AddEventHandler('ss-vending:checkcash', function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    local cash = Player.PlayerData.money.cash
    if cash >= Config.Products[item].price then
        TriggerClientEvent('ss-vending:progressbar', source, item)
    else
        TriggerClientEvent('QBCore:Notify', source, "Not enough cash to buy "..Config.Products[item].name, 'error', 5000)
    end
end)

RegisterNetEvent('ss-vending:giveitem')
AddEventHandler('ss-vending:giveitem', function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveMoney('cash', Config.Products[item].price)
    Player.Functions.AddItem(Config.Products[item].itemname, (Config.Products[item].amount or 1))
    if Config.successmessage == true then
        TriggerClientEvent('QBCore:Notify', source, "Successfully bought "..Config.Products[item].name, 'success', 5000)
    end
end)
