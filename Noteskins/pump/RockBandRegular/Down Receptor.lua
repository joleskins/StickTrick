local sButton = Var "Button";
local sPlayer = Var "Player";


local CustomRotation = {
	--dance
	Up = {2.5,0},
	Down = {-2.5,0},
	Left = {-7.5,0},
	Right = {7.5,0},
	--pump
	DownLeft = {0,0},
	DownRight = {0,-0},
	UpLeft = {0,0},
	UpRight = {0,0},
	Center = {0,0},
};


local Position = {
	--dance
	Up = {2.5,0},
	Down = {-2.5,0},
	Left = {-7.5,0},
	Right = {7.5,0},
	--pump
	DownLeft = {-0,0},
	DownRight = {0,0},
	UpLeft = {0,0},
	UpRight = {0,0},
	Center = {0,0},
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


local Colour = {
	--dance
	Up = "Blue",
	Down = "Yellow",
	Left = "Red",
	Right = "Green",
	--pump
	DownLeft = "Red",
	DownRight = "Green",
	UpLeft = "Yellow",
	UpRight = "Blue",
	Center = "#eec26e",
};

local RotSide = {
	[1] = 0,
	[2] = 180,
};

local Location = {};
local rBack = {};

if GAMESTATE:GetCurrentGame():GetName() == "dance" then
	if string.find(GAMESTATE:GetCurrentStyle(pn):GetStepsType() ,"Double") then
		Location = {
			--dance
			[1] = 224,
			[2] = 128,
			[3] = 128,
			[4] = 128,
			[5] = -128,
			[6] = -128,
			[7] = -128,
			[8] = -128,
		};
		rBack = {
			[1] = {0.8,256},
			[2] = {0,0},
			[3] = {0,0},
			[4] = {0,0},
			[5] = {0,0},
			[6] = {0,0},
			[7] = {0,0},
			[8] = {0,0},
		};
	else
		Location = {
			--dance
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
		};
		rBack = {
			[1] = {0.8,64},
			[2] = {0.8,64},
			[3] = {0.8,64},
			[4] = {0.8,64},
		};
	end
else
	Location = {
		--pump
		[1] = 0,
		[2] = 16,
		[3] = 0,
		[4] = -16,
		[5] = 0,
	};
	rBack = {
		[1] = {.8,64},
		[2] = {.8,64},
		[3] = {.8,64},
		[4] = {.8,64},
		[5] = {.8,64},
	};
end;

if rButton == nil then
	rButton = 1;
else
	rButton = rButton + 1;
end;

local t = Def.ActorFrame {};

if sButton == "Center" or (rButton == 1 and string.find(GAMESTATE:GetCurrentStyle(pn):GetStepsType() ,"Double") )then
	t = Def.ActorFrame {
		Def.Quad {
			InitCommand=function(self)
				self:diffuse(color("0,0,0,0.4")):diffusealpha(0):scaletoclipped(rBack[rButton][2],4000):fadetop(0)
			end;
		};
	};
else
	t = Def.ActorFrame {
		InitCommand=function(self)
			self:sleep(0.1):queuecommand("Reset")
		end;
		ResetCommand=function(self)
			rButton = 0;
		end;
		Def.Quad {
			InitCommand=function(self)
				self:diffuse(color("0,0,0,0.4")):diffusealpha(rBack[rButton][1]):scaletoclipped(rBack[rButton][2],3200):fadetop(.05)
			end;
		};
		--[[Def.Quad {
			InitCommand=function(self)
				self:diffuse(color("1,0,0,1")):halign(0):zoomto(10,3200):fadetop(.05)
			end;
		};

		Def.Quad {
			InitCommand=function(self)
				self:diffuse(color("1,0,0,1")):halign(1):zoomto(10,3200):fadetop(.05)
			end;
		};--]]

		Def.ActorFrame {
			OnCommand=function(self)
				self:rotationx(110):rotationz(CustomRotation[sButton][1]):z(Position[sButton][2])
			end;
			Def.Model {
				Meshes=NOTESKIN:GetPath("","Tex/_Receptor "..Colour[sButton]);
				Materials=NOTESKIN:GetPath("","Tex/_Receptor "..Colour[sButton]);
				Bones=NOTESKIN:GetPath("","Tex/_Receptor "..Colour[sButton]);
				PressCommand=function(self)
					self:stoptweening():bounceend(0.05):y(-6):bounceend(0.05):y(0)
				end;
			};
		};
		--LoadFont("Common Normal") .. { Text=rButton };
	};
end;

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

if sButton == "Center" or (rButton == 1 and string.find(GAMESTATE:GetCurrentStyle(pn):GetStepsType() ,"Double") )then
else
	for i=1,2 do
		for i2=1,15 do
			t[#t+1] = Def.ActorFrame {
				OnCommand=function(self)
					self:rotationx(90):rotationz(Position[sButton][1]):z(Position[sButton][2])
				end;
				Def.Model {
					Meshes=NOTESKIN:GetPath("","Tex/_Explosion Side");
					Materials=NOTESKIN:GetPath("","Tex/_Explosion Side");
					Bones=NOTESKIN:GetPath("","Tex/_Explosion Side");
					InitCommand=function(self)
						self:diffusealpha(0):rotationy(RotSide[i])
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
						self:finishtweening();
							self:diffuse(color(Colour2[sButton]));
							self:diffusealpha(1*math.random(1,3)/3);
							self:x(0);
							self:y(0);
							self:z(0);
							self:linear(0.1);
							self:rotationy(15*math.random(0,6));
							self:z(10*math.random(-2,4));
							self:x(5*math.random(-3,3));
							self:y(10*math.random(2,4));
							self:linear(0.05);
							self:diffusealpha(0);
						end;
					end;
				};
				
			};
for p=1,30 do
			t[#t+1] = LoadActor (NOTESKIN:GetPath( "_Hold", "Explosion Part" ))..{
				--Name="Particle1";
				InitCommand=function(self)
					self:diffuse(color(Colour2[sButton])):diffusealpha(0)
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
						self:finishtweening();
							self:blend("BlendMode_Add");
							self:diffuse(color(Colour2[sButton]));
							self:zoom(1*math.random(2,3)/3);
							self:x(1*math.random(-20,20));
							self:y(0);
							self:diffusealpha(1*math.random(1,3)/3);
							self:rotationx(90);
							self:z(0);
							self:linear(0.25);
							self:z(20*math.random(1,3));
							self:x(5*math.random(-10,10));
							self:y(10*math.random(2,5));
							self:diffusealpha(0);
					end;
				end;
			};
			--[[t[#t+1] = LoadActor (NOTESKIN:GetPath( "_Hold", "Explosion Part" ))..{
				Name="Particle2";
				InitCommand=function(self)
					self:diffuse(color(Colour2[sButton])):diffusealpha(0)
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
						self:finishtweening();
							self:diffuse(color(Colour2[sButton]));
							self:zoom(1*math.random(2,3)/3);
							self:x(0);
							self:y(0);
							self:diffusealpha(1*math.random(1,3)/3);
							self:rotationx(90);
							self:z(0);
							self:linear(0.2);
							self:z(20*math.random(1,4));
							self:x(5*math.random(-2,2));
							self:y(10*math.random(2,20));
							self:linear(0.05);
							self:diffusealpha(0);
					end;
				end;
			};
			t[#t+1] = LoadActor (NOTESKIN:GetPath( "_Hold", "Explosion Part" ))..{
				Name="Particle3";
				InitCommand=function(self)
					self:diffuse(color(Colour2[sButton])):diffusealpha(0)
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
						self:finishtweening();
							self:diffuse(color(Colour2[sButton]));
							self:zoom(1*math.random(2,3)/3);
							self:x(0);
							self:y(0);
							self:diffusealpha(1*math.random(1,3)/3);
							self:rotationx(90);
							self:z(0);
							self:linear(0.2);
							self:z(20*math.random(1,4));
							self:x(5*math.random(-2,2));
							self:y(10*math.random(2,20));
							self:linear(0.05);
							self:diffusealpha(0);
					end;
				end;
			};
			t[#t+1] = LoadActor (NOTESKIN:GetPath( "_Hold", "Explosion Part" ))..{
				Name="Particle4";
				InitCommand=function(self)
					self:diffuse(color(Colour2[sButton])):diffusealpha(0)
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
						self:finishtweening();
							self:diffuse(color(Colour2[sButton]));
							self:zoom(1*math.random(2,3)/3);
							self:x(0);
							self:y(0);
							self:diffusealpha(1*math.random(1,3)/3);
							self:rotationx(90);
							self:z(0);
							self:linear(0.2);
							self:z(20*math.random(1,4));
							self:x(5*math.random(-2,2));
							self:y(10*math.random(2,20));
							self:linear(0.05);
							self:diffusealpha(0);
					end;
				end;
			};--]]
		end;
	end;
end;
end;

return t;
