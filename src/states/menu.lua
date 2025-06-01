local Menu = {}

function Menu.load()
    print("Menu loaded")
end

function Menu.draw()
    love.graphics.print("Menu - Press Enter", 100, 100)
end

function Menu.keypressed(key)
    if key == "return" then
        require("src.stateManager").switch("game")
    end
end

return Menu

