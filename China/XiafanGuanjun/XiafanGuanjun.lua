-- Xiafan Guanjun
-- Author: Blue Ghost
-- DateCreated: 
--------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")

function Kowtow(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_CHINA_KOWTOW"]) then
			local iMinorPlayerID = pUnit:GetPlot():GetOwner()
			
			if iMinorPlayerID >= 0 then
				local pMinorPlayer = Players[iMinorPlayerID]
			
				if pMinorPlayer:IsMinorCiv() then
					pMinorPlayer:ChangeMinorCivFriendshipWithMajor(iPlayer, 2)
				
					if pPlayer:IsHuman() then
						local vHex = ToHexFromGrid(Vector2(pUnit:GetX(), pUnit:GetY()))
						Events.AddPopupTextEvent(HexToWorld(vHex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_INFLUENCE]", 2), true)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(Kowtow)