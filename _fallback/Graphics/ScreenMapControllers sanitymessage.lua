return Def.ActorFrame {
	InitCommand = function(self)
		self:diffusealpha(0)
	end,
	Def.Quad {
		InitCommand = function(self)
			self:diffusealpha(0)
		end,
		SetTextCommand = function(self)
			self:diffusealpha(0)
		end,
		TweenOffCommand = function(self)
			self:diffusealpha(0)
		end
	},
	Def.ActorFrame {
		Def.BitmapText {
			Font = "Common Normal",
			InitCommand = function(self)
				self:diffusealpha(0)
			end,
			SetTextCommand = function(self)
				self:diffusealpha(0)
			end,
			TweenOnCommand = function(self)
				self:diffusealpha(0)
			end,
			TweenOffCommand = function(self)
				self:diffusealpha(0)
			end
		}
	}
}
