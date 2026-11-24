local maxSteps = 6      -- 6 steps * 5px = +30px max growth
local stepSize = 5      -- width increase per step
local maxIcons = 100    -- scans MeterIcon1 through MeterIcon100 automatically

local icons = {}

function Initialize()
    icons = {}

    for i = 1, maxIcons do
        local name = 'MeterIcon' .. i
        local meter = SKIN:GetMeter(name)

        if meter ~= nil then
            local x = SKIN:ParseFormula(meter:GetOption('X', '0')) or 0
            local y = SKIN:ParseFormula(meter:GetOption('Y', '0')) or 0
            local w = SKIN:ParseFormula(meter:GetOption('W', '35')) or 35

            icons[i] = {
                name = name,
                baseX = x,
                baseY = y,
                baseW = w,
                target = 0,
                current = 0
            }
        end
    end
end

function SetHover(index, state)
    index = tonumber(index)
    state = tonumber(state)

    if icons[index] ~= nil then
        icons[index].target = state
        -- Wake up the Update() loop only when an icon is hovered or unhovered
        SKIN:Bang('!EnableMeasure', 'ScriptHover')
    end
end

function Update()
    local changed = false

    for _, icon in pairs(icons) do
        local t = icon.target * maxSteps
        local c = icon.current

        if c < t then
            c = math.min(c + 1, t)
        elseif c > t then
            c = math.max(c - 1, t)
        end

        if c ~= icon.current then
            icon.current = c
            changed = true

            local w = icon.baseW + (c * stepSize)
            local x = icon.baseX - (c * 2)
            local y = icon.baseY - (c * 2)

            SKIN:Bang('!SetOption', icon.name, 'W', w)
            SKIN:Bang('!SetOption', icon.name, 'X', x)
            SKIN:Bang('!SetOption', icon.name, 'Y', y)
            SKIN:Bang('!UpdateMeter', icon.name)
        end
    end

    if changed then
        SKIN:Bang('!Redraw')
    else
        -- Put the script back to sleep once all icons finish animating
        SKIN:Bang('!DisableMeasure', 'ScriptHover')
    end

    return 0
end