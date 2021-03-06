--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,		BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_ARABIA', 'BUILDINGCLASS_UNIVERSITY', 'BUILDING_ARABIA_MADRASAH');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
			(Type,						Description,						Civilopedia,								Strategy,										Help,										GoldMaintenance, Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,							GreatWorkYieldType,	UnlockedByBelief, SpecialistCount, SpecialistType, IlliteracyHappinessChange, GreatPeopleRateModifier)
SELECT		'BUILDING_ARABIA_MADRASAH', 'TXT_KEY_BUILDING_ARABIA_MADRASAH', 'TXT_KEY_BUILDING_ARABIA_MADRASAH_TEXT',	'TXT_KEY_BUILDING_ARABIA_MADRASAH_STRATEGY',	'TXT_KEY_BUILDING_ARABIA_MADRASAH_HELP',	GoldMaintenance, Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 2,				'EXPANSION_SCEN_BUILDING_ATLAS',	GreatWorkYieldType,	UnlockedByBelief, SpecialistCount, SpecialistType, IlliteracyHappinessChange, GreatPeopleRateModifier+15
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';
--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
			(BuildingType,					FlavorType,				Flavor)
VALUES		('BUILDING_ARABIA_MADRASAH',	'FLAVOR_SCIENCE',		80),
			('BUILDING_ARABIA_MADRASAH',	'FLAVOR_GREAT_PEOPLE',	50),
			('BUILDING_ARABIA_MADRASAH',	'FLAVOR_RELIGION',		30);
--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType,				BuildingClassType)
SELECT		'BUILDING_ARABIA_MADRASAH', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';
--------------------------------
-- Building_FeatureYieldChanges
--------------------------------
INSERT INTO Building_FeatureYieldChanges
			(BuildingType,				FeatureType, YieldType, Yield)
SELECT		'BUILDING_ARABIA_MADRASAH', FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE	BuildingType = 'BUILDING_UNIVERSITY';
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType,				YieldType, Yield)
SELECT		'BUILDING_ARABIA_MADRASAH', YieldType, Yield
FROM Building_YieldChanges WHERE	BuildingType = 'BUILDING_UNIVERSITY';
	
INSERT INTO Building_YieldChanges
			(BuildingType,					YieldType,		Yield)
VALUES		('BUILDING_ARABIA_MADRASAH',	'YIELD_FAITH',	2);
--------------------------------
-- Building_GrowthExtraYield
--------------------------------
INSERT INTO Building_GrowthExtraYield
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_ARABIA_MADRASAH',	'YIELD_SCIENCE',	25);
--==========================================================================================================================
--==========================================================================================================================