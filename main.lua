local love = require("love")
local push = require("lib.push.push")

local stateManager = require("src.stateManager")

local WINDOW_WIDTH, WINDOW_HEIGHT = 990, 512
local VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 990, 512

function love.load()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
    })

    stateManager.switch("menu")
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    stateManager.keypressed(key)
end

function love.update(dt)
    stateManager.update(dt)
end

function love.draw()
    push:start() -- begin drawing with virtual resolution

    stateManager.draw()

    push:finish() -- end drawing with virtual resolution
end
