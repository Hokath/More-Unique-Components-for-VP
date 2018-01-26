-- Chaebol (altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/2018
--------------------------------------------------------------
function TradeRoutesToGPPAndGold(iPlayer)
	local pPlayer = Players[iPlayer]
  numTR = pPlayer:GetNumInternationalTradeRoutes()
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_BUILDING_C15_SKOREA_CHAEBOL) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGPPANDGOLD, numTR)
		end
	end
end

GameEvents.PlayerDoTurn.Add(TradeRoutesToGPPAndGold)
