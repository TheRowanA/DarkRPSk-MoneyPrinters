ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "VIP Diamond Money Printer"
ENT.Author = "TheRowan"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Skyline Gaming"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Entity", 0, "owning_ent")
end