
TheFastestEnchanter = LibStub("AceAddon-3.0"):NewAddon("TheFastestEnchanter", "AceConsole-3.0", "AceEvent-3.0")

-- Init state
TheFastestEnchanter:RegisterChatCommand("tfe", "TFESlash")
TheFastestEnchanter.Enabled = false
TheFastestEnchanter.Invite = true
TheFastestEnchanter.Advertise = true
TheFastestEnchanter.AdvertiseMessages = {"Hey, I've got all enchanting recipes. What can I do for you?" }--, "Whisper me '!ench [item]' with an item link and I'll reply back with the enchants I can do, the materials and any fees."}
TheFastestEnchanter.NoFeeMessage = "Tip whatever you think is fair"
TheFastestEnchanter.SearchString = "[lL][fF] [eE][nN][cC][hH][aA][nN][tT]"
-- also 'any enchanter'

-- Enchant lookup tables
TheFastestEnchanter.EnchantableItemLocations = {
    "INVTYPE_CHEST", 
    "INVTYPE_ROBE", 
    "INVTYPE_FEET", 
    "INVTYPE_WRIST", 
    "INVTYPE_HAND", 
    "INVTYPE_CLOAK",
    "INVTYPE_WEAPON", 
    "INVTYPE_SHIELD", 
    "INVTYPE_2HWEAPON", 
    "INVTYPE_WEAPONMAINHAND", 
    "INVTYPE_WEAPONOFFHAND"
}

-- Enchant lookup tables
TheFastestEnchanter.EnchantsTable = {
    --[[
        { ["itemEquipLoc"] = "", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },

    { ["itemEquipLoc"] = "INVTYPE_CHEST", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },
    { ["itemEquipLoc"] = "INVTYPE_ROBE", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 00000, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "",  },
    ]]

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 25080, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Superior Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 25081, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Greater Fire Resistance",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 25083, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Stealth",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 25079, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Healing Power",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 25086, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Dodge",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 25074, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Frost Power",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 25073, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Shadow Power",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 25082, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Greater Nature Resistance",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 25078, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Fire Power",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 23801, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Mana Regeneration",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 20032, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Lifestealing",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20032, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Lifestealing",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 20032, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Lifestealing",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 20032, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Lifestealing",  },

    { ["itemEquipLoc"] = "INVTYPE_CHEST", ["spellId"] = 20025, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Chest - Greater Stats",  },
    { ["itemEquipLoc"] = "INVTYPE_ROBE", ["spellId"] = 20025, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Chest - Greater Stats",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 23804, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Intellect",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 23804, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Intellect",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 23804, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Intellect",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 23804, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Intellect",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 23803, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Spirit",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 23803, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Spirit",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 23803, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Spirit",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 23803, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Mighty Spirit",  },

    { ["itemEquipLoc"] = "INVTYPE_CHEST", ["spellId"] = 13941, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Chest - Stats",  },
    { ["itemEquipLoc"] = "INVTYPE_ROBE", ["spellId"] = 13941, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Chest - Stats",  },

    { ["itemEquipLoc"] = "INVTYPE_FEET", ["spellId"] = 13890, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Boots - Minor Speed",  },

    -- { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 13915, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Demonslaying",  },
    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 13915, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Demonslaying",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 13915, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Demonslaying",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 13915, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Demonslaying",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 20010, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Superior Strength",  },

    { ["itemEquipLoc"] = "INVTYPE_CHEST", ["spellId"] = 20026, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Chest - Major Health",  },
    { ["itemEquipLoc"] = "INVTYPE_ROBE", ["spellId"] = 20026, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Chest - Major Health",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 20013, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Greater Strength",  },

    { ["itemEquipLoc"] = "INVTYPE_CHEST", ["spellId"] = 20028, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Chest - Major Mana",  },
    { ["itemEquipLoc"] = "INVTYPE_ROBE", ["spellId"] = 20028, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Chest - Major Mana",  },

    { ["itemEquipLoc"] = "INVTYPE_FEET", ["spellId"] = 20024, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Boots - Spirit",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20036, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant 2H Weapon - Major Intellect",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20035, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant 2H Weapon - Major Spirit",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 20012, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Greater Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 20009, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Superior Spirit",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20030, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant 2H Weapon - Superior Impact",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 20034, ["hasFee"] = true, ["fee"] = 5, ["spellName"] = "Enchant Weapon - Crusader",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20034, ["hasFee"] = true, ["fee"] = 5, ["spellName"] = "Enchant Weapon - Crusader",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 20034, ["hasFee"] = true, ["fee"] = 5, ["spellName"] = "Enchant Weapon - Crusader",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 20034, ["hasFee"] = true, ["fee"] = 5, ["spellName"] = "Enchant Weapon - Crusader",  },

    -- { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 20033, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Unholy Weapon",  },
    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20033, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Unholy Weapon",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 20033, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Unholy Weapon",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 20033, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Unholy Weapon",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 20031, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Superior Striking",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20031, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Superior Striking",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 20031, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Superior Striking",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 20031, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Superior Striking",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 13948, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Minor Haste",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 13947, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Riding Skill",  },

    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 13937, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant 2H Weapon - Greater Impact",  },

    -- { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 13943, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Greater Striking",  },
    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 13943, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Greater Striking",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 13943, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Greater Striking",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 13943, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Greater Striking",  },

    { ["itemEquipLoc"] = "INVTYPE_SHIELD", ["spellId"] = 13933, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Shield - Frost Resistance",  },

    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 13898, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Fiery Weapon",  },
    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 13898, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Fiery Weapon",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 13898, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Fiery Weapon",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 13898, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Fiery Weapon",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 13939, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Greater Strength",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 13868, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Advanced Herbalism",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 13841, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Advanced Mining",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 13698, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Skinning",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 13657, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Fire Resistance",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 13620, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Fishing",  },

    { ["itemEquipLoc"] = "INVTYPE_FEET", ["spellId"] = 13637, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Boots - Lesser Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 20015, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Superior Defense",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 20011, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Superior Stamina",  },

    { ["itemEquipLoc"] = "INVTYPE_FEET", ["spellId"] = 20023, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Boots - Greater Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 20008, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Greater Intellect",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 13945, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Greater Stamina",  },

    { ["itemEquipLoc"] = "INVTYPE_SHIELD", ["spellId"] = 20017, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Shield - Greater Stamina",  },

    { ["itemEquipLoc"] = "INVTYPE_FEET", ["spellId"] = 20020, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Boots - Greater Stamina",  },

    { ["itemEquipLoc"] = "INVTYPE_FEET", ["spellId"] = 13935, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Boots - Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 13882, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Lesser Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 25084, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Subtlety",  },

    { ["itemEquipLoc"] = "INVTYPE_HAND", ["spellId"] = 25072, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Gloves - Threat",  },

    -- { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 21931, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Winter's Might",  },
    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 21931, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Winter's Might",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 21931, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Winter's Might",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 21931, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Winter's Might",  },

    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 20029, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Icy Chill",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 20029, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Icy Chill",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 20029, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Icy Chill",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 20029, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Icy Chill",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 27837, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant 2H Weapon - Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_WRIST", ["spellId"] = 23802, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Bracer - Healing Power",  },

    -- { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 23799, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Strength",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 23799, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Strength",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 23799, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Strength",  },
    -- { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 23799, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Weapon - Strength",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 23800, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Agility",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 23800, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Agility",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 23800, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Agility",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONOFFHAND", ["spellId"] = 23800, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Agility",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 22750, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Healing Power",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 22750, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Healing Power",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 22750, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Healing Power",  },

    { ["itemEquipLoc"] = "INVTYPE_2HWEAPON", ["spellId"] = 22749, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Spell Power",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPONMAINHAND", ["spellId"] = 22749, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Spell Power",  },
    { ["itemEquipLoc"] = "INVTYPE_WEAPON", ["spellId"] = 22749, ["hasFee"] = true, ["fee"] = 10, ["spellName"] = "Enchant Weapon - Spell Power",  },

    { ["itemEquipLoc"] = "INVTYPE_CLOAK", ["spellId"] = 20014, ["hasFee"] = false, ["fee"] = 0, ["spellName"] = "Enchant Cloak - Greater Resistance",  }
}

-- Lifecyle events & helpers
function TheFastestEnchanter:Trace(message)
    TheFastestEnchanter:Print(message)
end

function TheFastestEnchanter:OnInitialize()
    self:RegisterEvent("PLAYER_LOGIN")
end

function TheFastestEnchanter:OnEnable()
end

function TheFastestEnchanter:OnDisable()
end

function TheFastestEnchanter:PLAYER_LOGIN(...)
   -- TheFastestEnchanter:Trace("Loaded. Use /tfe to enable/disable, or /tfe help for a list of commands")
    TheFastestEnchanter:Trace("Loaded. Use /tfe to enable/disable.")
end


-- On chat messages observed
function TheFastestEnchanter:CHAT_MSG_CHANNEL(event, text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
    
    TheFastestEnchanter:CheckChatMessage(text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
end

function TheFastestEnchanter:CHAT_MSG_YELL(event, text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
    
    if strmatch(text, TheFastestEnchanter.SearchString) then
        TheFastestEnchanter:OfferEnchantingService(playerName)
    end
end

function TheFastestEnchanter:CHAT_MSG_WHISPER(event, text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)

    if not TheFastestEnchanter.Advertise then return end
    local enchRequest = strfind(text, "!ench")
    local itemId = select(3, strfind(text, "item:(%d+)"))
    if enchRequest ~= nil and itemId ~= nil then
        self:AdvertiseEnchantsForItemSlot(itemId, playerName)
    end

end

function TheFastestEnchanter:AdvertiseEnchantsForItemSlot(itemId, playerName)
    
    -- iterate enchants for slot
    -- Use Apis IsSpellKnown(), GetSpellInfo()
    -- Respond with chat throttle lib, appropriate response
    --[[
        I have...
        [Enchant link] for 5g fee.
        [Enchant link] tip whatever you like.
        If you want low level enchants, ask about them directly.

        Or
        I cannot enchant this item
    ]]

    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId)

    local canEnchant = false

    for _,slot in pairs(self.EnchantableItemLocations) do
        if slot == itemEquipLoc then 
            canEnchant = true
            break
        end
    end

    if not canEnchant then
        self:Whisper(playerName, "Enchanters cannot enchant that item, sorry.")
        self:Trace("Cant enchant : " .. itemEquipLoc)
        return
    end

    local enchantsToAdvertise = { }

    for _,enchant in pairs(self.EnchantsTable) do
        local equipLoc = enchant.itemEquipLoc
        local spellId = enchant.spellId
        local spellName = enchant.spellName

        if itemEquipLoc == equipLoc then

            local known = IsUsableSpell(spellId)

            -- local n, r, i, c, minR, maxR, id = GetSpellInfo(spellId)
            -- self:Trace("info id: " .. id)
            -- self:Trace("spell id: " .. spellId)
            
            local message = "Can do: "
            local link = "|cffffffff|Henchant:" .. spellId .. "|h[" .. spellName .. "]|h|r"
            message = message .. link
            if enchant.hasFee and fee ~= 0 then
                message = message .. " The fee is " .. enchant.fee .. "g"
            end
            table.insert(enchantsToAdvertise, message)
        end
    end

    if tablelength(enchantsToAdvertise) > 0 then
        self:Whisper(playerName, "Everything is for tips, unless a fee is mentioned.")
        for _,enchantMessage in pairs(enchantsToAdvertise) do
            self:Whisper(playerName, enchantMessage)
        end
        self:Whisper(playerName, "If you want low level enchants, ask about them directly.")
        InviteUnit(playerName)
    else
        self:Whisper(playerName, "I cannot enchant this item, sorry.")
    end
end

function TheFastestEnchanter:Whisper(player, message)
    ChatThrottleLib:SendChatMessage("NORMAL", "tfe", message, "WHISPER", nil, player)
end

function TheFastestEnchanter:CheckChatMessage(text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)

    if strmatch(channelBaseName, "Trade") or strmatch(channelBaseName, "General") then
        if strmatch(text, TheFastestEnchanter.SearchString) then
            TheFastestEnchanter:OfferEnchantingService(playerName)
        end
    end
end

function TheFastestEnchanter:OfferEnchantingService(playerName)
    TheFastestEnchanter:Trace("Advertising to " .. playerName)

    for k,v in pairs(self.AdvertiseMessages) do
        if self.Advertise then ChatThrottleLib:SendChatMessage("ALERT", "tfe", v, "WHISPER", nil, playerName) end
    end

    if TheFastestEnchanter.Invite then InviteUnit(playerName) end
end

-- command line options
function TheFastestEnchanter:TFESlash(input)
    
    if input ~= "" then
        if input == "help" then
            -- Todo
            TheFastestEnchanter:Trace("'/tfe invite' to toggle auto-invites")
            TheFastestEnchanter:Trace("'/tfe advertise' to toggle advertise whispers")

        elseif input == "invite" then
            TheFastestEnchanter.Invite = not TheFastestEnchanter.Invite
            local state = "off"
            if TheFastestEnchanter.Invite then state = "on" end
            TheFastestEnchanter:Trace("auto-invites " .. state)
        elseif input == "advertise" then
            TheFastestEnchanter.Advertise = not TheFastestEnchanter.Advertise
            local state = "off"
            if TheFastestEnchanter.Advertise then state = "on" end
            TheFastestEnchanter:Trace("advertise whispers " .. state)
        else
            TheFastestEnchanter:Trace("Use /tfe to enable/disable, or /tfe help for a list of commands")
        end
        return
    end

    -- turn on/off
    if TheFastestEnchanter.Enabled then
        TheFastestEnchanter:Trace("Disabled")
        self:UnregisterEvent("CHAT_MSG_CHANNEL")
        self:UnregisterEvent("CHAT_MSG_YELL")
        self:UnregisterEvent("CHAT_MSG_WHISPER")
    else
        TheFastestEnchanter:Trace("Enabled")
        self:RegisterEvent("CHAT_MSG_CHANNEL")
        self:RegisterEvent("CHAT_MSG_YELL")
        self:RegisterEvent("CHAT_MSG_WHISPER")
    end

    TheFastestEnchanter.Enabled = not TheFastestEnchanter.Enabled
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end