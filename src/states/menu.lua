local Menu = {}

local Button = require("src.ui.button")

local background
local bgScaleX, bgScaleY = 1, 1

local titleFont
local buttonFont

local startButton

function Menu.load()
    background = love.graphics.newImage("assets/menu/background.png")
    local bgWidth = background:getWidth()
    local bgHeight = background:getHeight()
    bgScaleX = 990 / bgWidth
    bgScaleY = 512 / bgHeight

    titleFont = love.graphics.newFont(96)
    buttonFont = love.graphics.newFont(48)
    love.graphics.setFont(buttonFont)

    -- Create button
    startButton = Button:new{
        x = (990 - 500) / 2,
        y = 200,
        width = 500,
        height = 100,
        text = "Start New Game",
        bgColor = {0.6, 0.6, 0.9},
        onHover = function()
            love.graphics.setColor(0.8, 0.8, 1)
        end,
        onClick = function()
            require("src.stateManager").switch("game")
        end
    }

    print("Menu loaded")
end

function Menu.update(dt)
    Button.updateAll(dt)
end

function Menu.draw()
    -- Background
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(background, 0, 0, 0, bgScaleX, bgScaleY)

    -- Title
    love.graphics.setFont(titleFont)
    love.graphics.setColor(1, 1, 1)
    local titleText = "Animalia"
    local titleWidth = titleFont:getWidth(titleText)
    love.graphics.print(titleText, (990 - titleWidth) / 2, 50)

    -- Draw buttons
    Button.drawAll()
end

function Menu.mousepressed(x, y, button)
    Button.mousepressed(x, y, button)
end

function Menu.keypressed(key)
    if key == "return" then
        require("src.stateManager").switch("game")
    end
end

return Menu

