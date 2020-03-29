local t = Def.ActorFrame{}

if rButton == nil then
	rButton = 1;
else
	rButton = rButton + 1;
end;

local rBack = {
	[1] = {0.8,64},
	[2] = {0.8,64},
	[3] = {0.8,64},
	[4] = {0.8,64},
};

local function ScreenFilter()
	return Def.Sprite{
		Texture=THEME:GetPathG("","Highway")
		InitCommand=function(self)
				self:texturewrapping(true):diffusealpha(rBack[rButton][1]):zoomto(rBack[rButton][2],3200):fadetop(.05):texcoordvelocity(0,-0.5)
			end,
		PlayerStateSetCommand = function(self,param)
			local pn = param.PlayerNumber
			local style = GAMESTATE:GetCurrentStyle(pn)
			local width = style:GetWidth(pn) + 8
			local filterAlpha = playerConfig:get_data(pn_to_profile_slot(pn)).ScreenFilter
			if filterAlpha == 0 then
				self:visible(false)
				return
			end
			self:visible(true)
			self:SetWidth(width)
			self:SetHeight(3200)
			self:diffusealpha(1)
		end
	}

return t