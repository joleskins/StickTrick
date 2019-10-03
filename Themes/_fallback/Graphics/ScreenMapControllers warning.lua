return Def.ActorFrame {
	InitCommand = function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
	end,
	Def.Quad {
		InitCommand = function(self)
			self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT):diffuse(Color.Black)
		end,
		TweenOnCommand = function(self)
			self:diffusealpha(0):diffusealpha(0)
		end,
		TweenOffCommand = function(self)
			self:diffusealpha(0)
		end
	},
	Def.ActorFrame {
		Def.BitmapText {
			Font = "Common Normal",
			Text = ScreenString("WarningHeader"),
			InitCommand = function(self)
				self:y(-80):diffuse(Color.Red)
			end,
			TweenOnCommand = function(self)
				self:diffusealpha(0)
			end,
			TweenOffCommand = function(self)
				self:diffusealpha(0)
			end
		},
		Def.BitmapText {
			Font = "Common Normal",
			Text = ScreenString("WarningText"),
			InitCommand = function(self)
				self:y(10):wrapwidthpixels(SCREEN_WIDTH - 48)
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
