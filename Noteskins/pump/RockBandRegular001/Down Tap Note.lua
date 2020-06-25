local sButton = Var "Button";

local Position = {
	--dance
	Up = {2.5,0},
	Down = {-2.5,0},
	Left = {-7.5,-5.5},
	Right = {7.5,-5.5},
	--pump
	DownLeft = {-7.5,0},
	DownRight = {7.5,0},
	UpLeft = {-2.5,0},
	UpRight = {2.5,0},
	Center = {0,0},
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

if vButton == nil then
	vButton = 1;
else
	vButton = vButton + 1;
end;

local HatOrNote = "Note";

if vButton < 12 then
	HatOrNote = "Hat";
else
	HatOrNote = "Note";
end;

local t = Def.ActorFrame {};

if sButton == "Center" or ( ( vButton == 1 or vButton == 2 ) and string.find(GAMESTATE:GetCurrentStyle(pn):GetStepsType() ,"Double") ) then
	t = Def.ActorFrame {
		LoadActor("Center Hold Body")..{
			InitCommand=function(self)
				self:x(96):rotationy(-2):z(-1.5):zoomx(64):zoomy(1.5)
			end;
		};
		LoadActor("Center Hold Body")..{
			InitCommand=function(self)
				self:x(32):rotationy(-1):z(0):zoomx(64):zoomy(1.5)
			end;
		};
		LoadActor("Center Hold Body")..{
			InitCommand=function(self)
				self:x(-32):rotationy(1):z(0):zoomx(64):zoomy(1.5)
			end;
		};
		LoadActor("Center Hold Body")..{
			InitCommand=function(self)
				self:x(-96):rotationy(2):z(-1.5):zoomx(64):zoomy(1.5)
			end;
		};
	};
else
	t = Def.ActorFrame {
		InitCommand=function(self)
			self:sleep(0.1):queuecommand("Reset")
		end;
		ResetCommand=function(self)
			vButton = 0;
		end;
		Def.Model {
			Meshes=NOTESKIN:GetPath("","Tex/_Tap "..HatOrNote.." "..Colour[sButton]);
			Materials=NOTESKIN:GetPath("","Tex/_Tap "..HatOrNote.." "..Colour[sButton]);
			Bones=NOTESKIN:GetPath("","Tex/_Tap "..HatOrNote.." "..Colour[sButton]);
			InitCommand=function(self)
				self:rotationx(90):rotationz(0):z(Position[sButton][2])
			end;
		};
		--LoadFont("Common Normal") .. { Text=vButton };
	};
end;

return t;
