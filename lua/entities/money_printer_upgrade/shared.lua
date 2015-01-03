ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Printer Upgrade"
ENT.Author = "TheRowan"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Skyline Gaming"

function ENT:SetupDataTables()
	
	self:DTVar("Entity", 0, "owning_ent")

end