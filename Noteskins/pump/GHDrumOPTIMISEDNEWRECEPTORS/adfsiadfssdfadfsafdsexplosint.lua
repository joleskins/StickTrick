local sButton = Var "Button";
local sPlayer = Var "Player";

local Colour = {
	--dance
	Up = "#0000FF",
	Down = "#FFFF00",
	Left = "#FF0000",
	Right = "#00FF00",
	--pump
	DownLeft = "#FF0000",
	DownRight = "#00FF00",
	UpLeft = "#FFFF00",
	UpRight = "#0000FF",
	Center = "#FFA500",
};

local Colour2 = {
	--dance
	Up = "#0000FF",
	Down = "#FFFF00",
	Left = "#FF0000",
	Right = "#00FF00",
	--pump
	DownLeft = "#da3038",
	DownRight = "#187818",
	UpLeft = "#f2e349",
	UpRight = "#3265ec",
	Center = "#ffffb5",
};

local position = {
	--dance
	Up = {-2.5,0},
	Down = {2.5,0},
	Left = {7.5,5.5},
	Right = {-7.5,5.5},
	--pump
	DownLeft = {7.5,5.5},
	DownRight = {-7.5,5.5},
	UpLeft = {2.5,0},
	UpRight = {-2.5,0},
	Center = {0,0},
};

if eButton == nil then
	eButton = 1;
else
	eButton = eButton + 1;
end;

if rButton == nil then
	rButton = 1;
else
	rButton = rButton + 1;
end;

local t = Def.ActorFrame {};

local play = 1;
t[#t+1] = Def.ActorFrame {
	OnCommand=function()
		local getc = SCREENMAN:GetTopScreen():GetChild("Player"..ToEnumShortString(sPlayer)):GetChild("NoteField"):get_column_actors()
		for i2 in pairs(getc) do
			getc[i2]:x(Location[i2]);
		end;
	end;
	W1Command=function(self)
		self:queuecommand("Move")
	end;
	W2Command=function(self)
		self:queuecommand("Move")
	end;
	W3Command=function(self)
		self:queuecommand("Move")
	end;
	MoveCommand=function(self)
		play = play + 1
		if play > 15 then play = 1; end;
	end;
};

if sButton == "Center" or (eButton == 2 and string.find(GAMESTATE:GetCurrentStyle(pn):GetStepsType() ,"Double") )then
	for i=1,2 do
		for i2=1,15 do
			t[#t+1] = Def.ActorFrame {
				OnCommand=function(self)
					self:rotationx(0):z(Position[sButton][2])
				end;
				Def.Model {
					Meshes=NOTESKIN:GetPath("","Tex/_Explosion Side");
					Materials=NOTESKIN:GetPath("","Tex/_Explosion Side");
					Bones=NOTESKIN:GetPath("","Tex/_Explosion Side");
					InitCommand=function(self)
						self:diffusealpha(0)
					end;
					W1Command=function(self)
						self:queuecommand("Move")
					end;
					W2Command=function(self)
						self:queuecommand("Move")
					end;
					W3Command=function(self)
						self:queuecommand("Move")
					end;
					W4Command=function(self)
						self:queuecommand("Move")
					end;
					W5Command=function(self)
						self:queuecommand("Move")
					end;
					MoveCommand=function(self)
					if play == i2 then
						self:diffusealpha(0)
						end;
					end;
				};
				
			};

			t[#t+1] = Def.ActorFrame{
			Def.Sprite {
				Name="POP";
				Texture="_POP";
				Frame0000=0;
				Delay0000=.016;
				Frame0001=1;
				Delay0001=.016;
				Frame0002=2;
				Delay0002=.016;
				Frame0003=3;
				Delay0003=.016;
				Frame0004=4;
				Delay0004=.016;
				Frame0005=5;
				Delay0005=.016;
				InitCommand=function(self)
					self:diffuse(color("#eb6523")):diffusealpha(0):zoom(1):zoomy(1.3):draworder(math.huge)
				end;
				OnCommand=function(self)
					self:rotationx(90):z(Position[sButton][2])
				end;
				W1Command=function(self)
					self:queuecommand("Move")
				end;
				W2Command=function(self)
					self:queuecommand("Move")
				end;
				W3Command=function(self)
					self:queuecommand("Move")
				end;
				W4Command=function(self)
					self:queuecommand("Move")
				end;
				W5Command=function(self)
					self:queuecommand("Move")
				end;
				MoveCommand=function(self)
					if play == i2 then
						self:stoptweening():setstate(0):diffusealpha(1):blend('BlendMode_Add'):linear(.095):linear(.001):diffusealpha(0)
					end;
				end;
				};
			};
		end;
	end;
	t[#t+1] = Def.ActorFrame {
		--[[W1Command=function(self)
			self:z(0):zoomx(1):diffusealpha(1):zoomy(1):linear(0.1):addz(10):zoomy(1.5):zoomx(1.1):diffusealpha(0)
		end;
		W2Command=function(self)
			self:z(0):zoomx(1):diffusealpha(1):zoomy(1):linear(0.1):addz(10):zoomy(1.5):zoomx(1.1):diffusealpha(0)
		end;
		W3Command=function(self)
			self:z(0):zoomx(1):diffusealpha(1):zoomy(1):linear(0.1):addz(10):zoomy(1.5):zoomx(1.1):diffusealpha(0)
		end;
		W4Command=function(self)
			self:z(0):zoomx(1):diffusealpha(1):zoomy(1):linear(0.1):addz(10):zoomy(1.5):zoomx(1.1):diffusealpha(0)
		end;
		W5Command=function(self)
			self:z(0):zoomx(1):diffusealpha(1):zoomy(1):linear(0.1):addz(10):zoomy(1.5):zoomx(1.1):diffusealpha(0)
		end;
		NoneCommand=function(self)
			self:z(0):zoomx(1):diffusealpha(1):zoomy(1):linear(0.1):addz(10):zoomy(1.5):zoomx(1.1):diffusealpha(0)
		end;--]]
		
		LoadActor("HOTKICKSINGLEFRAME")..{
					Name="HottestKick";
					InitCommand=function(self)
						self:blend("BlendMode_Add"):z(5);
					end;
					W1Command=function(self)
							self:playcommand("Move")
					end;
					W2Command=function(self)
							self:playcommand("Move")
					end;
					W3Command=function(self)
							self:playcommand("Move")
					end;
					W4Command=function(self)
							self:playcommand("Move")
					end;
					W5Command=function(self)
							self:playcommand("Move")
					end;
					MoveCommand=function(self)
							self:finishtweening();
								self:z(5);
								self:rotationx(60);
								self:zoomy(1);
								self:zoom(1,1);
								self:linear(0.032);
								self:diffusealpha(0);
								self:linear(0.096);
								self:addz(-10);
								self:zoomy(.4);
								--self:diffuse(color("#6f4300"));
								self:diffusealpha(0);
								--self:rotationx(90);
					end;
		};

		LoadActor("HOTKICKSINGLEFRAME")..{
					Name="HottestKick2";
					InitCommand=function(self)
						self:blend("BlendMode_Add");
					end;
					W1Command=function(self)
							self:playcommand("Move")
					end;
					W2Command=function(self)
							self:playcommand("Move")
					end;
					W3Command=function(self)
							self:playcommand("Move")
					end;
					W4Command=function(self)
							self:playcommand("Move")
					end;
					W5Command=function(self)
							self:playcommand("Move")
					end;
					MoveCommand=function(self)
							self:finishtweening();
								self:z(5);
								self:rotationx(60);
								self:zoomy(1);
								self:zoom(1,1);
								self:linear(0.032);
								self:diffusealpha(0);
								self:linear(0.096);
								self:addz(-10);
								self:zoomy(.4);
								--self:diffuse(color("#6f4300"));
								self:diffusealpha(0);
								--self:rotationx(90);
					end;
		};
};
else
	t = Def.ActorFrame {
		InitCommand=function(self)
			self:y(position[sButton][2]):queuecommand("Reset")
		end;
		ResetCommand=function(self)
			eButton = 0;
		end;
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_Tap", "Explosion Inside" );
			W1Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W2Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W3Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W4Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W5Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			HoldingOnCommand=function(self)
				self:zoom(1)
			end;
			HoldingOffCommand=function(self)
				self:diffusealpha(0)
			end
		};
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_Tap", "Explosion Outside" );
			W1Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W2Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W3Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W4Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
			W5Command=function(self)
				self:zoom(1):linear(0.1):zoom(1.5):diffusealpha(0)
			end;
		};
	};
end;

for i=1,10 do
	t[#t+1] = Def.ActorFrame {
		OnCommand=function(self)
			self:rotationx(90);
		end;
		Def.ActorFrame {
			HoldingOnCommand=function(self)
				self:queuecommand("Move")
			end;
			MoveCommand=function(self)
				self:zoom(0.1*math.random(1,6));
				self:diffusealpha(1)
				self:x(0);
				self:z(0);
				self:linear(0.02*math.random(1,10));
				self:x(10*math.random(-3,3));
				self:z(10*math.random(1,6));
				self:linear(0.05);
				self:diffusealpha(0)
				self:linear(0.1);
				self:queuecommand("Move");
			end;
			LoadActor(NOTESKIN:GetPath( "_Hold", "Explosion Part" ))..{
				W1Command=function(self)
					self:diffusealpha(0)
				end;
				W2Command=function(self)
					self:diffusealpha(0)
				end;
				W3Command=function(self)
					self:diffusealpha(0)
				end;
				W4Command=function(self)
					self:diffusealpha(0)
				end;
				W5Command=function(self)
					self:diffusealpha(0)
				end;
				HoldingOnCommand=function(self)
					self:diffusealpha(1)
				end;
				HoldingOffCommand=function(self)
					self:diffusealpha(0)
				end;
			};
		};
	};
end;

return t;

