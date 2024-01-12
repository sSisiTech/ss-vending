QBCore = exports['qb-core']:GetCoreObject()


function makeEntityFaceEntity( entity1, entity2 )
   local p1 = GetEntityCoords(entity1, true)
   local p2 = GetEntityCoords(entity2, true)

   local dx = p2.x - p1.x
   local dy = p2.y - p1.y

   local heading = GetHeadingFromVector_2d(dx, dy)
   SetEntityHeading( entity1, heading )
end

RegisterNetEvent('ss-vending:buyitem')
AddEventHandler('ss-vending:buyitem', function(data)
   TriggerServerEvent("ss-vending:checkcash", data.productName)
end)
 
 RegisterNetEvent('ss-vending:progressbar')
 AddEventHandler('ss-vending:progressbar', function(product)

   local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
   makeEntityFaceEntity( PlayerPedId(), GetClosestObjectOfType(x,y,z,2.0,Config.Vendings[product].modelname,false,false,false) )

    QBCore.Functions.Progressbar("buy_"..product, "Buying "..product, (Config.Vendings[product].duration or 5000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, 
     {
         animDict = Config.Vendings[product].animDict or "mini@sprunk",
         anim = Config.Vendings[product].anim or "plyr_buy_drink_pt1",
         flags = Config.Vendings[product].flags or 49,
     },
      {}, {}, function()
        TriggerServerEvent("ss-vending:giveitem", product)
     end, function()
     end)
 end)

 for _, vending in pairs(Config.Vendings) do
   for _, product in pairs (vending.products) do
      exports.ox_target:addModel(vending.modelhash, {
         productName = Config.Products[product].name,
         distance = vending.distance or 1,
         name = "buy-"..Config.Products[product].name,
         event = ('ss-vending:buyitem'),
         icon = Config.Products[product].icon or 'fa-solid fa-wine-bottle',
         label = "Buy ".. Config.Products[product].name .." ($" .. Config.Products[product].price .. ")",
      })
   end
 end