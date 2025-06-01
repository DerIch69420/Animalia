local StateManager = {}
local current
local states = {}

function StateManager.switch(name)
    if not states[name] then
        states[name] = require("src.states." .. name)
    end
    current = states[name]
    if current.load then
        current.load()
    end
end

function StateManager.update(dt)
    if current and current.update then
        current.update(dt)
    end
end

function StateManager.draw()
    if current and current.draw then
        current.draw()
    end
end

function StateManager.keypressed(key)
    if current and current.keypressed then
        current.keypressed(key)
    end
end

function StateManager.mousepressed(x, y, button)
    if current and current.mousepressed then
        current.mousepressed(x, y, button)
    end
end

return StateManager
