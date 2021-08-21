ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('supreme_moneylaunder:GetCash')
AddEventHandler('supreme_moneylaunder:GetCash', function(itemName, price)
	local xPlayer  = ESX.GetPlayerFromId(source)
        local randomLaunder = math.random(1000,2000)
		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.removeAccountMoney('black_money', randomLaunder)
			xPlayer.addMoney(randomLaunder)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You laundered $' .. randomLaunder, })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You dont have any ', })
		end
end)
