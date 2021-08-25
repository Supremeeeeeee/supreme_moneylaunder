ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('supreme_moneylaunder:GetCash')
AddEventHandler('supreme_moneylaunder:GetCash', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.removeAccountMoney('black_money', 1000)
			xPlayer.addMoney(1000)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You laundered $1000', })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You dont have any ', })
		end
end)
