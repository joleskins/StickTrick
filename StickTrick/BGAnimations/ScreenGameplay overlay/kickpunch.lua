return Def.ActorFrame {
    JudgmentMessageCommand = function(self, params)
        local col = params.FirstTrack
        if col ~= 2 then return end    -- c++ indices start at 0
        local nf = SCREENMAN:GetTopScreen():GetChild("PlayerP1"):GetChild("NoteField")
        for i = 1,5 do
            if i ~= 3 then
                nf:step(i, "TapNoteScore_None") -- hook handles the conversion for the index by itself
            end
        end
    end,
    StepMessageCommand = function(self, params)
        if params.Column ~= 2 then return end
        local nf = SCREENMAN:GetTopScreen():GetChild("PlayerP1"):GetChild("NoteField")
        for i = 1,5 do
            if i ~= 3 then
                nf:step(i, "TapNoteScore_None") -- hook handles the conversion for the index by itself
            end
        end
    end
}