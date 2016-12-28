statPriorityStats = {}

statPriorityStats["WARRIORArms"] = "Mastery > Strength > Versatility > Haste > Critical Strike"
statPriorityStats["WARRIORFury"] = "Strength > Haste to 50% > Mastery > Versatility > Critical Strike"
statPriorityStats["WARRIORProtection"] = "Strength > Haste > Versatility > Mastery > Critical Strike"

statPriorityStats["PALADINHoly"] = "Intellect > Critical Strike > Versatility > Mastery > Haste"
statPriorityStats["PALADINProtection"] = "Haste > Versatility > Mastery > Critical Strike"
statPriorityStats["PALADINRetribution"] = "Strength > Haste to 20% > Critical Strike = Versatility > Mastery"

statPriorityStats["HUNTERBeast Mastery"] = "Agility > Mastery > Haste > Critical Strike > Versatility"
statPriorityStats["HUNTERMarksmanship"] = "Mastery > Agility > Haste > Critical Strike > Versatility"
statPriorityStats["HUNTERSurvival"] = "Agility > Haste > Versatility > Critical Strike > Mastery"

statPriorityStats["ROGUEAssassination"] = "Agility > Mastery > Critical Strike > Versatility > Haste"
statPriorityStats["ROGUEOutlaw"] = "Agility > Versatility > Critical Strike > Mastery > Haste"
statPriorityStats["ROGUESubtlety"] = "Agility > Versatility > Mastery > Critical Strike > Haste"

statPriorityStats["PRIESTDiscipline"] = "Intellect > Haste > Critical Strike > Mastery > Versatility"
statPriorityStats["PRIESTHoly"] = "Intellect > Mastery > Critical Strike > Haste > Versatility"
statPriorityStats["PRIESTShadow"] = "Critical Strike > Haste > Mastery > Intellect > Versatility"
statPriorityStats["PRIESTMadness"] = "Haste > Critical Strike > Mastery > Intellect > Versatility"

statPriorityStats["SHAMANElemental"] = "Intellect > Critical Strike > Haste > Versatility > Mastery"
statPriorityStats["SHAMANEnhancement"] = "Agility > Mastery > Haste > Versatility > Critical Strike"
statPriorityStats["SHAMANRestoration"] = "Intellect > Mastery > Critical Strike > Haste > Versatility"

statPriorityStats["MAGEArcane"] = "Intellect > Mastery > Critical Strike > Versatility > Haste"
statPriorityStats["MAGEFire"] = "Critical Strike > Intellect > Mastery > Versatility > Haste"
statPriorityStats["MAGEFrost"] = "Intellect > Haste > Critical Strike > Versatility > Mastery"

statPriorityStats["WARLOCKAffliction"] = "Mastery > Intellect > Haste > Critical Strike > Versatility"
statPriorityStats["WARLOCKDemonology"] = "Haste > Intellect > Critical Strike > Mastery > Versatility"
statPriorityStats["WARLOCKDestruction"] = "Intellect > Haste > Critical Strike > Versatility > Mastery"

statPriorityStats["DRUIDBalance"] = "Haste > Intellect > Critical Strike > Versatility > Mastery"
statPriorityStats["DRUIDFeral"] = "Agility > Mastery > Critical Strike > Versatility > Haste"
statPriorityStats["DRUIDGuardian"] = "Versatility > Mastery > Haste > Agility > Critical Strike"
statPriorityStats["DRUIDRestoration"] = "Intellect > Haste > Critical Strike > Mastery > Versatility"

statPriorityStats["MONKBrewmaster"] = "Haste to 30% > Critical Strike = Mastery > Agility > Versatility"
statPriorityStats["MONKMistweaver"] = "Intellect > Versatility > Critical Strike > Haste = Mastery"
statPriorityStats["MONKFistweaver"] = "Intellect > Versatility > Haste > Critical Strike > Mastery"
statPriorityStats["MONKWindwalker"] = "Agility > Mastery > Versatility > Critical Strike > Haste"

statPriorityStats["DEATHKNIGHTBlood"] = "Strength > Haste > Critical Strike > Versatility > Mastery"
statPriorityStats["DEATHKNIGHTFrost"] = "Strength > Haste to 20% > Critical Strike to 25% > Versatility > Mastery"
statPriorityStats["DEATHKNIGHTUnholy"] = "Strength > Critical Strike > Haste to 18% > Mastery > Versatility"
statPriorityStats["DEATHKNIGHTShadows"] = "Strength > Haste > Mastery > Critical Strike > Versatility"

statPriorityStats["DEMONHUNTERHavoc"] = "Agility > Critical Strike > Versatility > Haste > Mastery"
statPriorityStats["DEMONHUNTERVengeance"] = "Agility > Mastery > Critical Strike > Versatility > Haste"

function statPriorityFrameOnEvent(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == "StatPriority" then
		self:UnregisterEvent("ADDON_LOADED")
		PaperDollFrame:HookScript("OnShow", function() statPriorityFrameUpdate(self) end)
	end
	if event == "SPELLS_CHANGED" and IsAddOnLoaded("StatPriority") then
		statPriorityFrameUpdate(self)
	end
end

function statPriorityFrameCreate(frame)
	if PaperDollFrame:IsVisible() then
		frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
						   edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
						   tile = true,
						   tileSize = 16,
						   edgeSize = 16, 
						   insets = {left = 1,
									 right = 1,
									 top = 1,
									 bottom = 1}}) 
		frame:SetBackdropColor(0, 0, 0, 1)
		frame:SetFrameStrata("TOOLTIP")
		frame:SetWidth(PaperDollFrame:GetWidth() - 50) 
		frame:SetHeight(25)
		statPriorityText:ClearAllPoints()
		statPriorityText:SetAllPoints(frame) 
		statPriorityText:SetJustifyH("CENTER")
		statPriorityText:SetJustifyV("CENTER")
		frame:ClearAllPoints()
		frame:SetPoint("BOTTOMRIGHT", PaperDollFrame, "TOPRIGHT",0,0)
		frame:SetParent(PaperDollFrame)
		frame:Show()
		return true
	end
	return false
end

function GetSpecializationName(id)
	local spec = ""
	if id == 62 then 
		spec = "Arcane"
	elseif id == 63 then 
		spec = "Fire"
	elseif id == 64 then 
		spec = "Frost"
	elseif id == 65 then 
		spec = "Holy"
	elseif id == 66 then 
		spec = "Protection"
	elseif id == 70 then 
		spec = "Retribution"
	elseif id == 71 then 
		spec = "Arms"
	elseif id == 72 then 
		spec = "Fury"
	elseif id == 73 then 
		spec = "Protection"
	elseif id == 102 then 
		spec = "Balance"
	elseif id == 103 then 
		spec = "Feral"
	elseif id == 104 then 
		spec = "Guardian"
	elseif id == 105 then 
		spec = "Restoration"
	elseif id == 250 then 
		spec = "Blood"
	elseif id == 251 then 
		spec = "Frost"
	elseif id == 252 then 
		spec = "Unholy"
	elseif id == 253 then 
		spec = "Beast Mastery"
	elseif id == 254 then 
		spec = "Marksmanship"
	elseif id == 255 then 
		spec = "Survival"
	elseif id == 256 then 
		spec = "Discipline"
	elseif id == 257 then 
		spec = "Holy"
	elseif id == 258 then 
		spec = "Shadow"
	elseif id == 259 then 
		spec = "Assassination"
	elseif id == 260 then 
		spec = "Outlaw"
	elseif id == 261 then 
		spec = "Subtlety"
	elseif id == 262 then 
		spec = "Elemental"
	elseif id == 263 then 
		spec = "Enhancement"
	elseif id == 264 then 
		spec = "Restoration"
	elseif id == 265 then 
		spec = "Affliction"
	elseif id == 266 then 
		spec = "Demonology"
	elseif id == 267 then 
		spec = "Destruction"
	elseif id == 268 then 
		spec = "Brewmaster"
	elseif id == 269 then 
		spec = "Windwalker"
	elseif id == 270 then 
		spec = "Mistweaver"
	elseif id == 577 then 
		spec = "Havoc"
	elseif id == 581 then 
		spec = "Vengeance"
	end
	return spec
end

function statPriorityFrameUpdate(frame)
	if statPriorityFrameCreate(frame) then
		local temp, class = UnitClass("player")
		local spec = GetSpecializationInfo(GetSpecialization())
		spec = GetSpecializationName(spec)
		local text = statPriorityStats[class .. spec];
		if class == "PRIEST" then
			if IsSpellKnown(193223) then
				text = statPriorityStats[class .. "Madness"]
			end
		elseif class == "MONK" then
			if IsSpellKnown(210802) then
				text = statPriorityStats[class .. "Fistweaver"]
			end
		elseif class == "DEATHKNIGHT" then
			if IsSpellKnown(207311) then
				text = statPriorityStats[class .. "Shadows"]
			end
		end
		statPriorityText:SetText(text)
	end
end

local statPriorityFrame = CreateFrame("FRAME", nil, UIParent)
statPriorityText = statPriorityFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
statPriorityFrame:RegisterEvent("ADDON_LOADED")
statPriorityFrame:RegisterEvent("SPELLS_CHANGED")
statPriorityFrame:SetScript("OnEvent", statPriorityFrameOnEvent)
