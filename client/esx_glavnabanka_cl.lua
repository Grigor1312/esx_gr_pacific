local holdingup = false
local store = ""
local blipRobbery = nil

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_glavnabanka:currentlyrobbing')
AddEventHandler('esx_glavnabanka:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
end)

RegisterNetEvent('esx_glavnabanka:killblip')
AddEventHandler('esx_glavnabanka:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_glavnabanka:setblip')
AddEventHandler('esx_glavnabanka:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

--RegisterNetEvent('esx_glavnabanka:toofarlocal')
--AddEventHandler('esx_glavnabanka:toofarlocal', function(robb)
	--holdingup = false
	--ESX.ShowNotification(_U('robbery_cancelled'))
	--robbingName = ""
	--incircle = false
--end)


RegisterNetEvent('esx_glavnabanka:robberycomplete')
AddEventHandler('esx_glavnabanka:robberycomplete', function(robb)
	holdingup = false

		TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.sex == 0 then

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
	    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	    end
	    end)
	ESX.ShowNotification(_U('robbery_complete'))
	store = ""
	incircle = false
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 439)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)


incircle = false

hasrobbed = false
hasrobbed2 = false
hasrobbed3 = false
hasrobbed4 = false
hasrobbed5 = false
hasrobbed6 = false
hasrobbed7 = false
hasrobbed8 = false
hasrobbed9 = false
hasrobbed10 = false
hasrobbed11 = false
hasrobbed12 = false
hasrobbed13 = false
hasrobbed14 = false
hasrobbed15 = false
hasrobbed16 = false

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

Citizen.CreateThread(function()
      
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob'))
						end
						incircle = true
						if IsPedShooting(GetPlayerPed(-1)) then

							gioielli1 = AddBlipForCoord(261.87, 212.85, 101.68)
							SetBlipSprite(gioielli1,1)
							SetBlipColour(gioielli1,16742399)
							SetBlipScale(gioielli1,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli1)

							gioielli2 = AddBlipForCoord(263.41, 212.28, 101.68)
							SetBlipSprite(gioielli2,1)
							SetBlipColour(gioielli2,16742399)
							SetBlipScale(gioielli2,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli2)

							gioielli3 = AddBlipForCoord(264.75, 211.85, 101.68)
							SetBlipSprite(gioielli3,1)
							SetBlipColour(gioielli3,16742399)
							SetBlipScale(gioielli3,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli3)

							gioielli4 = AddBlipForCoord(263.89, 214.76, 101.68)
							SetBlipSprite(gioielli4,1)
							SetBlipColour(gioielli4,16742399)
							SetBlipScale(gioielli4,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli4)


							gioielli5 = AddBlipForCoord(265.7, 212.55, 101.68)
							SetBlipSprite(gioielli5,1)
							SetBlipColour(gioielli5,16742399)
							SetBlipScale(gioielli5,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli5)

							gioielli6 = AddBlipForCoord(266.43, 214.37, 101.68)
							SetBlipSprite(gioielli6,1)
							SetBlipColour(gioielli6,16742399)
							SetBlipScale(gioielli6,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli6)

							gioielli7 = AddBlipForCoord(266.19, 215.63, 101.68)
							SetBlipSprite(gioielli7,1)
							SetBlipColour(gioielli7,16742399)
							SetBlipScale(gioielli7,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli7)

							gioielli8 = AddBlipForCoord(266.19, 215.63, 101.68)
							SetBlipSprite(gioielli8,1)
							SetBlipColour(gioielli8,16742399)
							SetBlipScale(gioielli8,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli8)

							gioielli9 = AddBlipForCoord(264.64, 216.17, 101.68)
							SetBlipSprite(gioielli9,1)
							SetBlipColour(gioielli9,16742399)
							SetBlipScale(gioielli9,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli9)

							gioielli10 = AddBlipForCoord(263.3, 216.69, 101.68)
							SetBlipSprite(gioielli10,1)
							SetBlipColour(gioielli10,16742399)
							SetBlipScale(gioielli10,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli10)

							gioielli11 = AddBlipForCoord(259.68, 213.69, 101.68)
							SetBlipSprite(gioielli11,1)
							SetBlipColour(gioielli11,16742399)
							SetBlipScale(gioielli11,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli11)

							gioielli12 = AddBlipForCoord(258.3, 214.2, 101.68)
							SetBlipSprite(gioielli12,1)
							SetBlipColour(gioielli12,16742399)
							SetBlipScale(gioielli12,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli12)

							gioielli13 = AddBlipForCoord(256.76, 214.7, 101.68)
							SetBlipSprite(gioielli13,1)
							SetBlipColour(gioielli13,16742399)
							SetBlipScale(gioielli13,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli13)

							gioielli14 = AddBlipForCoord(258.09, 218.04, 101.68)
							SetBlipSprite(gioielli14,1)
							SetBlipColour(gioielli14,16742399)
							SetBlipScale(gioielli14,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli14)

							gioielli15 = AddBlipForCoord(259.57, 218.04, 101.68)
							SetBlipSprite(gioielli15,1)
							SetBlipColour(gioielli15,16742399)
							SetBlipScale(gioielli15,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli15)

							gioielli16 = AddBlipForCoord(261.18, 217.49, 101.68)
							SetBlipSprite(gioielli16,1)
							SetBlipColour(gioielli16,16742399)
							SetBlipScale(gioielli16,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('jewelsblipmap'))
							EndTextCommandSetBlipName(gioielli16)

							TriggerServerEvent('esx_glavnabanka:rob', k)
                        end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then
							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 261.87, 212.85, 101.68, true) < 0.5 ) then
								if (hasrobbed == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 261.87, 212.85, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed)
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli1)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 263.41, 212.28, 101.68, true) < 0.5 ) then
								if (hasrobbed2 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 263.41, 212.28, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed)
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli2)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed2 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 264.75, 211.85, 101.68, true) < 0.5 ) then
								if (hasrobbed3 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 264.75, 211.85, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli3)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed3 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 263.89, 214.76, 101.68, true) < 0.5 ) then
								if (hasrobbed4 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 263.89, 214.76, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli4)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed4 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 265.7, 212.55, 101.68, true) < 0.5 ) then
								if (hasrobbed5 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 265.7, 212.55, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli5)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed5 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 266.43, 214.37, 101.68, true) < 0.5 ) then
								if (hasrobbed6 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 266.43, 214.37, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli6)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed6 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 266.19, 215.63, 101.68, true) < 0.5 ) then
								if (hasrobbed7 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 266.19, 215.63, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli7)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed7 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 266.19, 215.63, 101.68, true) < 0.5 ) then
								if (hasrobbed8 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 266.19, 215.63, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli8)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed8 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 264.64, 216.17, 101.68, true) < 0.5 ) then
							if (hasrobbed9 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 264.64, 216.17, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli9)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed9 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 263.3, 216.69, 101.68, true) < 0.5 ) then
							if (hasrobbed10 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 263.3, 216.69, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli10)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed10 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 259.68, 213.69, 101.68, true) < 0.5 ) then
							if (hasrobbed11 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 259.68, 213.69, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli11)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed11 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 258.3, 214.2, 101.68, true) < 0.5 ) then
							if (hasrobbed12 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 258.3, 214.2, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli12)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed12 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 256.76, 214.7, 101.68, true) < 0.5 ) then
							if (hasrobbed13 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 256.76, 214.7, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli13)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed13 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 258.09, 218.53, 101.68, true) < 0.5 ) then
							if (hasrobbed14 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 258.09, 218.53, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli14)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed14 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 259.57, 218.04, 101.68, true) < 0.5 ) then
							if (hasrobbed15 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 259.57, 218.04, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli15)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed15 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 261.18, 217.49, 101.68, true) < 0.5 ) then
							if (hasrobbed16 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", 261.18, 217.49, 101.68, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								Citizen.Wait(20000)
								ClearPedTasksImmediately(playerPed) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli16)
								TriggerServerEvent('esx_glavnabanka:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed16 = true
							end
							end
							end


							if (hasrobbed == true) and (hasrobbed2 == true) and (hasrobbed3 == true) and (hasrobbed4 == true) and (hasrobbed5 == true) and (hasrobbed6 == true) and (hasrobbed7 == true) and (hasrobbed8 == true) and (hasrobbed9 == true) and (hasrobbed10 == true) and (hasrobbed11 == true) and (hasrobbed12 == true) and (hasrobbed13 == true) and (hasrobbed14 == true) and (hasrobbed15 == true) and (hasrobbed16 == true) then
							holdingup = false
							
							hasrobbed = false
                            hasrobbed2 = false
                            hasrobbed3 = false
                            hasrobbed4 = false
                            hasrobbed5 = false
                            hasrobbed6 = false
                            hasrobbed7 = false
                            hasrobbed8 = false
                            hasrobbed9 = false
                            hasrobbed10 = false
                            hasrobbed11 = false
                            hasrobbed12 = false
                            hasrobbed13 = false
                            hasrobbed14 = false
                            hasrobbed15 = false
                            hasrobbed16 = false
							TriggerServerEvent('esx_glavnabanka:endrob', store)
							TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                        end)
							end	

			local pos2 = Stores[store].position

--			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -622.566, -230.183, 101.687, true) > 11.5 ) then
			--	TriggerServerEvent('esx_glavnabanka:toofar', store)
			--	holdingup = false
			--	RemoveBlip(gioielli1)
			--	RemoveBlip(gioielli2)
			--	RemoveBlip(gioielli3)
			--	RemoveBlip(gioielli4)
			--	RemoveBlip(gioielli5)
			--	RemoveBlip(gioielli6)
			--	RemoveBlip(gioielli7)
			--	RemoveBlip(gioielli8)
			--	RemoveBlip(gioielli9)
			--	RemoveBlip(gioielli10)
			--	RemoveBlip(gioielli11)
			--	RemoveBlip(gioielli12)
			--	RemoveBlip(gioielli13)
			--	RemoveBlip(gioielli14)
			--	RemoveBlip(gioielli15)
				--RemoveBlip(gioielli16)
			--	
			--	hasrobbed = false
--hasrobbed2 = false
           --     hasrobbed3 = false
              --  hasrobbed4 = false
              --  hasrobbed5 = false
              --  hasrobbed6 = false
              --  hasrobbed7 = false
                --hasrobbed8 = false
               -- hasrobbed9 = false
               -- hasrobbed10 = false
               -- hasrobbed11 = false
              --  hasrobbed12 = false
              --  hasrobbed13 = false
              --  hasrobbed14 = false
--hasrobbed15 = false
           --     hasrobbed16 = false
		--	end
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_glavnabanka:togliblip')
AddEventHandler('esx_glavnabanka:togliblip', function(robb)
	RemoveBlip(gioielli1)
	RemoveBlip(gioielli2)
	RemoveBlip(gioielli3)
	RemoveBlip(gioielli4)
	RemoveBlip(gioielli5)
	RemoveBlip(gioielli6)
	RemoveBlip(gioielli7)
	RemoveBlip(gioielli8)
	RemoveBlip(gioielli9)
	RemoveBlip(gioielli10)
	RemoveBlip(gioielli11)
	RemoveBlip(gioielli12)
	RemoveBlip(gioielli13)
	RemoveBlip(gioielli14)
	RemoveBlip(gioielli15)
	RemoveBlip(gioielli16)
end)


RegisterNetEvent("lester:createBlip")
AddEventHandler("lester:createBlip", function(type, x, y, z)



	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 1.3)
	SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Goldsmith")
		EndTextCommandSetBlipName(blip)

	

end)


Citizen.CreateThread(function()
	if Config.Goldbars then
		TriggerEvent('lester:createBlip', 354, 1974.92, 3819.06, 33.44)
	end
	
    while true do
       Citizen.Wait(0)
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1974.92, 3819.06, 33.44, true) <= 10 and not blip then
				DrawMarker(20, 1974.92, 3819.06, 33.44, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 100, 102, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, 1974.92, 3819.06, 33.44, true) < 1.0 then
					DisplayHelpText(_U('press_to_sell'))
					if IsControlJustReleased(1, 51) then
						blip = true
					--	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
						--	if quantity >= Config.MaxJewelsSell then
								ESX.TriggerServerCallback('esx_vangelico_robbery:conteggio', function(CopsConnected)
									if CopsConnected >= Config.RequiredCopsSell then
										TriggerServerEvent('trevor:vendita')
										blip = false
									else
										blip = false
										TriggerEvent('esx:showNotification', 'Potrebno policajaca za pljacku: ' .. Config.RequiredCopsSell)
									end
								end)
							else
								blip = false
								--TriggerEvent('esx:showNotification', _U('notenoughgold'))
					--		end
					--	end, 'goldbar')
					end
				end
			end
    end
end)



