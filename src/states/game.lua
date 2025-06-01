local Game = {}

function Game.load()
    print("Game loaded")
end

function Game.draw()
    love.graphics.print("Game - Press Enter", 100, 100)
end

function Game.keypressed(key)
    if key == "return" then
        require("src.stateManager").switch("menu")
    end
end

return Game

