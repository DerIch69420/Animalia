local love = require("love")
local push = require("lib.push")

local WINDOW_WIDTH, WINDOW_HEIGHT = 990, 512
local VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 990, 512

function love.load()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed() end

function love.update(dt) end

function love.draw()
    push:start() -- begin drawing with virtual resolution

    push:finish() -- end drawing with virtual resolution
end
