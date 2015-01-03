include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local num = 10
	
	local owner = self:Getowning_ent()
	owner = (IsValid(owner) and owner:Nick()) or "Unowned"

	surface.SetFont("HUDNumber5")
	local text = "Gold Money Printer"
	local money = "$" ..self:GetNWInt("PrintA")
	local txt3 = "HP: " ..self:GetNWInt("PrintB")
	local txt4 = "C: " ..self:GetNWInt("Coolant")
	local txt5 = "Print Time: " ..self:GetNWInt("PrintC").. " Seconds"
	local txt9 = "NotInstalled"
	local txt10 = "NotInstalled"
	local txt20 = "NotInstalled"
	local txt30 = "NotInstalled"
	if self:GetNWBool("CoolUpgraded") then --Geting Upgrade List
	txt9 = "Installed"
	end
	if self:GetNWBool("Silencer") then
	txt10 = "Installed"
	end
	if self:GetNWBool("Arma") then
	txt20 = "Installed"
	end
	if self:GetNWBool("Upgraded") then
	txt30 = "Installed"
	end
	local txt6 = "Cooler Upgrade: " .. txt9
	local txt11 = "Silencer Upgrade: " .. txt10
	local txt21 = "Amour Upgrade: " .. txt20
	local txt31 = "Printer Upgrade: " .. txt30
	local TextWidth = surface.GetTextSize(text)
	local TextWidth2 = surface.GetTextSize(owner)
	local TextWidth3 = surface.GetTextSize(money)
	local TextWidth4 = surface.GetTextSize(txt3)
	local TextWidth5 = surface.GetTextSize(txt4)
	local TextWidth6 = surface.GetTextSize(txt5)
	local TextWidth7 = surface.GetTextSize(txt6)

	Ang:RotateAroundAxis(Ang:Up(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 3.2, Ang, 0.10)
	surface.SetDrawColor(105,105,105, 50) --Red
	surface.DrawRect(95, 50, -190, -115)
	
	cam.End3D2D()
	

	cam.Start3D2D(Pos + Ang:Up() * 3.2, Ang, 0.10)
	surface.SetDrawColor(0,0,0, 210) --Red
	surface.DrawRect(105, 60, -210, -10)
	surface.DrawRect(105, 50, -10, -125)
	surface.DrawRect(95, -65, -200, -10)
	surface.DrawRect(-105, 50, 10, -115)
	
	cam.End3D2D()
	
	
	cam.Start3D2D(Pos + Ang:Up() * 3.2, Ang, 0.05)
		draw.WordBox(2, -TextWidth*0.5, -90, text, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -TextWidth2*0.5, -50, owner, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -TextWidth3*0.5, -10, money, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -TextWidth4*0.5, 30, txt3, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -TextWidth5*0.5, 70, txt4, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -TextWidth6*0.5, -130, txt5, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))


	cam.End3D2D()
	
	Ang:RotateAroundAxis(Ang:Forward(), 90)												-- Rotates label forward by 90
	
	cam.Start3D2D(Pos + Ang:Up() * 7.3, Ang, 0.07)
		if self:GetNWBool("Upgraded") then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/wrench_orange.png"))
			surface.DrawTexturedRect( -124, 20, 10, 10 )
			
		else
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/wrench.png"))
			surface.DrawTexturedRect( -124, 20, 10, 10 )
		end
		
		if self:GetNWBool("Arma") then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/shield_add.png"))
			surface.DrawTexturedRect( -124, 8, 10, 10 )
			
		else
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/shield.png"))
			surface.DrawTexturedRect( -124, 8, 10, 10 )
		end
		
		if self:GetNWBool("Silencer") then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/sound_mute.png"))
			surface.DrawTexturedRect( -124, -5, 10, 10 )
			
		else
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/sound.png"))
			surface.DrawTexturedRect( -124, -5, 10, 10 )
		end
		
		if self:GetNWBool("CoolUpgraded") then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/tag_blue_add.png"))
			surface.DrawTexturedRect( -124, -18, 10, 10 )
			
		else
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material("icon16/tag_blue.png"))
			surface.DrawTexturedRect( -124, -18, 10, 10 )
		end

		if self:GetNWBool("CoolantToggle") then
			draw.RoundedBox( 0, -124, -40, 248, 15, Color( 255, 255, 255, 255 ) )
			draw.RoundedBox( 0, -119, -40, 238, 15, Color( 180, 180, 180, 255 ) )
			draw.RoundedBox( 0, -119, -40, ( ( 238 / 100 ) * self:GetNWInt("Coolant") ), 15, Color( 0, 255, 255, 255 ) )
		end

	cam.End3D2D()
	
	-- Updating text
	
	cam.Start3D2D(Pos + Ang:Up() * 7.3, Ang, 0.03)
		draw.WordBox(2, -250, -50, txt6, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -250, -20, txt11, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -250, 10, txt21, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
		draw.WordBox(2, -250, 40, txt31, "HUDNumber5", Color(0, 0, 0, 0), Color(255,255,255,255))
	cam.End3D2D()

end

function ENT:Think()
end
