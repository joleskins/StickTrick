local song = GAMESTATE:GetCurrentSong()
local fn = song:GetBackgroundPath()
local t = Def.ActorFrame{}
    if fn ~= nil and FILEMAN:DoesFileExist(fn) then
		t = Def.Sprite {
			Texture=song:GetBackgroundPath();
			Frame0000=0;
			Delay0000=1;
			InitCommand=function(self)
				self:FullScreen():diffusealpha(0):draworder(0)
			end,
				OnCommand=function(self)
				self:linear(2):diffusealpha(.7):draworder(0)
			end,
	}

	else
		t = Def.Sprite {
			Texture=THEME:GetPathG("Screen", "Background");
			Frame0000=0;
			Delay0000=1;
			InitCommand=function(self)
				self:FullScreen():diffusealpha(0):draworder(0)
			end,
			OnCommand=function(self)
				self:linear(2):diffusealpha(.7):draworder(0)
			end,
	}
	end
return t