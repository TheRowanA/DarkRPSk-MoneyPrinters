include("shared.lua")

function ENT:Draw()
	self.Entity:DrawModel()
end


function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	surface.SetFont("HUDNumber5")
	local text = "Printer Armour"
	local TextWidth = surface.GetTextSize(text)

	Ang:RotateAroundAxis(Ang:Up(), 90)
	
	cam.Start3D2D(Pos + Ang:Up() * 3.2, Ang, 0.05)
		draw.WordBox(2, -TextWidth*0.5, -90, text, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Forward(), 90)	
end