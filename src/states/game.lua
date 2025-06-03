local Game = {}
local Player = require("src.game.player")

function Game.load()
    print("Game loaded")
    Player.load()
end

function Game.update(dt)
    Player.update(dt)
end

function Game.draw()
    -- love.graphics.print("Game - Press Enter", 100, 100)
    Player.draw()
end

function Game.keypressed(key)
    if key == "escape" then
        require("src.stateManager").switch("menu")
    end
end

return Game

