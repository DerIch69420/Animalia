local Menu = {}

local background
local bgScaleX, bgScaleY = 1, 1

local titleFont
local buttonFont

local button = {
    text = "Start New Game",
    x = 0, -- will be set in load
    y = 200,
    width = 500,
    height = 100,
    hovered = false,
}

function Menu.load()
    background = love.graphics.newImage("assets/menu/background.png")
    local bgWidth = background:getWidth()
    local bgHeight = background:getHeight()
    bgScaleX = 990 / bgWidth
    bgScaleY = 512 / bgHeight

    titleFont = love.graphics.newFont(96)
    buttonFont = love.graphics.newFont(48)

    -- Center button
    button.x = (990 - button.width) / 2

    print("Menu loaded")
end

function Menu.update(dt)
    local mx, my = love.mouse.getPosition()
    button.hovered = mx >= button.x
        and mx <= button.x + button.width
        and my >= button.y
        and my <= button.y + button.height
end

function Menu.draw()
    -- Background
    love.graphics.draw(background, 0, 0, 0, bgScaleX, bgScaleY)

    -- Title
    love.graphics.setFont(titleFont)
    love.graphics.setColor(1, 1, 1)
    local titleText = "Animalia"
    local titleWidth = titleFont:getWidth(titleText)
    love.graphics.print(titleText, (990 - titleWidth) / 2, 50)

    -- Button
    love.graphics.setFont(buttonFont)
    if button.hovered then
        love.graphics.setColor(0.8, 0.8, 1)
    else
        love.graphics.setColor(0.6, 0.6, 0.9)
    end
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height, 12, 12)

    love.graphics.setColor(0, 0, 0)
    local textWidth = buttonFont:getWidth(button.text)
    local textHeight = buttonFont:getHeight()
    love.graphics.print(
        button.text,
        button.x + (button.width - textWidth) / 2,
        button.y + (button.height - textHeight) / 2
    )
end

function Menu.mousepressed(x, y, buttonPressed)
    if buttonPressed == 1 and button.hovered then
        require("src.stateManager").switch("game")
    end
end

function Menu.keypressed(key)
    if key == "return" then
        require("src.stateManager").switch("game")
    end
end

return Menu

