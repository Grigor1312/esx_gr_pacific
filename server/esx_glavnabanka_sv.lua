local rob = false
local robbers = {}
PlayersCrafting    = {}
local CopsConnected  = 0
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

--RegisterServerEvent('esx_glavnabanka:toofar')
--AddEventHandler('esx_glavnabanka:toofar', function(robb)
	--local source = source
	--local xPlayers = ESX.GetPlayers()
	--rob = false
	--for i=1, #xPlayers, 1 do
 	--	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		--if xPlayer.job.name == 'police' then
	--		TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Stores[robb].nameofstore)
	--		TriggerClientEvent('esx_glavnabanka:killblip', xPlayers[i])
	--	end
	--end
	--if(robbers[source])then
		--TriggerClientEvent('esx_glavnabanka:toofarlocal', source)
		--robbers[source] = nil
		--TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Stores[robb].nameofstore)
	--end
--end)

RegisterServerEvent('esx_glavnabanka:endrob')
AddEventHandler('esx_glavnabanka:endrob', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('end'))
			TriggerClientEvent('esx_glavnabanka:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_glavnabanka:robberycomplete', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_ended') .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esx_glavnabanka:rob')
AddEventHandler('esx_glavnabanka:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if Stores[robb] then

		local store = Stores[robb]

		if (os.time() - store.lastrobbed) < 259200 and store.lastrobbed ~= 0 then

            TriggerClientEvent('esx_glavnabanka:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (259200 - (os.time() - store.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
 		if xPlayer.job.name == 'fbi' then
				cops = cops + 1
			end
		
		end
		


		if rob == false then
		
			if(cops >= Config.RequiredCopsRob)then

				rob = true
				TriggerClientEvent("chatMessage", -1, "^4NEWS", {255, 0, 0}, "Someone is robbing the Pacific Standard bank! ")
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' then
							TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
							TriggerClientEvent('esx_glavnabanka:setblip', xPlayers[i], Stores[robb].position)
					end
					if xPlayer.job.name == 'fbi' then
							TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
							TriggerClientEvent('esx_glavnabanka:setblip', xPlayers[i], Stores[robb].position)
					end
				end

				TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. store.nameofstore .. _U('do_not_move'))
				TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
				TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
			    TriggerClientEvent('esx_glavnabanka:currentlyrobbing', source, robb)
                CancelEvent()
				Stores[robb].lastrobbed = os.time()
			else
				TriggerClientEvent('esx_glavnabanka:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, _U('min_two_police'))
			end
		else
			TriggerClientEvent('esx_glavnabanka:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
			
	end
	end
end)

RegisterServerEvent('esx_glavnabanka:gioielli1')
AddEventHandler('esx_glavnabanka:gioielli1', function()

	local xPlayer = ESX.GetPlayerFromId(source)
	
	if Config.Goldbars then
	
	xPlayer.addInventoryItem('goldbar', math.random(5, 10))
	
else
	reward = math.random(5000, 10000)
	xPlayer.addAccountMoney('black_money', reward)
	TriggerClientEvent('esx:showNotification', source, 'You took ' ..reward.. ' dirty money')
end

end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

RegisterServerEvent('trevor:vendita')
AddEventHandler('trevor:vendita', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ajtem = xPlayer.getInventoryItem('goldbar').count
	if ajtem > 10 then
	xPlayer.removeInventoryItem('goldbar', 10)
	xPlayer.addMoney(Config.PriceForTenGoldbars)
	end
end)

ESX.RegisterServerCallback('esx_vangelico_robbery:conteggio', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(CopsConnected)
end)
