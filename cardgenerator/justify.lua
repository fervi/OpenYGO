-- Downloaded from: https://love2d.org/forums/viewtopic.php?t=82981#p204509

function string:split(c) --I actually wrote this one, it accounts for splitters of multiple sizes
    local s = self
    local t = {""}
    local skip = 0
    for i = 1, string.len(s)+1-string.len(c) do
    local v = string.sub(s, i, i-1+string.len(c))
    if skip > 0 then
        skip = skip-1
    elseif v == c then
        table.insert(t, "")
        skip = string.len(c)-1
    else
        local lm = i
        if i == string.len(s)+1-string.len(c) then
	lm = -1
        end
        t[#t] = t[#t] .. string.sub(s, i, lm)
    end
    end
    
    return t
end
