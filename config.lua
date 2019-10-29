Config = {}
Config.Locale = 'en'

Config.RequiredCopsRob = 1
Config.RequiredCopsSell = 0
Config.Goldbars = true
Config.PriceForTenGoldbars = 1000
Config.MaxGoldbarSell = 150

Stores = {
	["Pacific Standar"] = {
		position = { ['x'] = 251.84, ['y'] = 218.82, ['z'] = 101.68 },       
		reward = math.random(60000,70000),
		nameofstore = "Pacific Standard",
		lastrobbed = 0
	}
}
