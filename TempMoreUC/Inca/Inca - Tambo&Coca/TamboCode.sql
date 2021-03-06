--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_INCA', 	'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_TAMBO');
--==========================================================================================================================
-- Buildings
--==========================================================================================================================

INSERT INTO Buildings 	
		(Type, 				BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, AlwaysHeal, 	TradeRouteLandGoldBonus, CityConnectionGoldModifier, FinishLandTRTourism, Description, 				Civilopedia, 					Help, 							Strategy,								PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_TAMBO',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, 5,				TradeRouteLandGoldBonus, 20,						 FinishLandTRTourism, 'TXT_KEY_BUILDING_TAMBO', 	'TXT_KEY_BUILDING_TAMBO_TEXT', 	'TXT_KEY_BUILDING_TAMBO_HELP', 	'TXT_KEY_BUILDING_TAMBO_STRATEGY',		PlotBuyCostModifier, ArtDefineTag,	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, 100, 			GreatPeopleRateModifier, FreshWater, HurryCostModifier, 0, 	'BUILDING_APIG4UC_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

--==========================================================================================================================
-- Resources
--==========================================================================================================================
--new Coca luxury

INSERT INTO Resources 
			(Type,				TechReveal,		TechCityTrade, 		Description,				Civilopedia, 					Help,	ResourceClassType, 		IsMonopoly, 	ArtDefineTag, 	CivilizationType,		OnlyMinorCivs,  Happiness,  IconString, 		PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_COCA',	null,			'TECH_CURRENCY',	'TXT_KEY_RESOURCE_COCA',	'TXT_KEY_RESOURCE_COCA_TEXT',	null,	'RESOURCECLASS_LUXURY',	1,				'ART_DEF_COCA',	'CIVILIZATION_INCA',	0,				4,			'[ICON_RES_COCA]',	1, 				'4UC_COCA_ATLAS');

--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
--promotions granted by Coca monopoly

INSERT INTO UnitPromotions 
		(Type, 						WorkRateMod,	MountainsDoubleMove, Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			LostWithUpgrade, 	PediaType,	PediaEntry)
VALUES	('PROMOTION_COCA_MILITARY',	0,				1,					'TXT_KEY_PROMOTION_COCA_MILITARY',	'TXT_KEY_PROMOTION_COCA_MILITARY_HELP', 'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	1,					null,		null),
		('PROMOTION_COCA_WORKER',	15,				0,					'TXT_KEY_PROMOTION_COCA_WORKER',	'TXT_KEY_PROMOTION_COCA_WORKER_HELP', 	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	1, 					null, 		null),

INSERT INTO UnitPromotions_Terrains
	(PromotionType, 			TerrainType, 		Attack, Defense)
VALUES
	('PROMOTION_COCA_MILITARY', 'TERRAIN_MOUNTAIN', 10, 	10);		

------------------------------	
-- Building_Yields
------------------------------
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_TAMBO', 'YIELD_PRODUCTION', 2),
	('BUILDING_TAMBO', 'YIELD_GOLD', 2);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_TAMBO', 'BUILDINGCLASS_GRANARY', 'YIELD_PRODUCTION', 2),

--Tambo gives 1 free copy of Coca
INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_TAMBO', 'RESOURCE_COCA', 1);

--luxury resource yield increases and +1 gold to specialists, same as caravansary
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
SELECT 'BUILDING_TAMBO', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE Type = 'BUILDING_CARAVANSARY';		

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
SELECT 'BUILDING_TAMBO', SpecialistType, YieldType, Yield
FROM Building_SpecialistYieldChangesLocal WHERE Type = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors
		(BuildingType,			FlavorType,				Flavor)
VALUES	('BUILDING_TAMBO',		'FLAVOR_HAPPINESS',		40),
		('BUILDING_TAMBO',		'FLAVOR_PRODUCTION',	20),
		('BUILDING_TAMBO',		'FLAVOR_CULTURE',		20),
		('BUILDING_TAMBO',		'FLAVOR_GOLD',			40);