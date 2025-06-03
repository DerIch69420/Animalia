local Player = {}

local speed = 200

Player.x = 100
Player.y = 100
Player.size = 32

function Player.load()
	-- for later (maybe)
end

function Player.update(dt)
	if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
		Player.y = Player.y - speed * dt
	end
	if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
		Player.y = Player.y + speed * dt
	end
	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		Player.x = Player.x - speed * dt
	end
	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		Player.x = Player.x + speed * dt
	end
end

function Player.draw()
	love.graphics.setColor(1, 1, 1) -- white
	love.graphics.rectangle("fill", Player.x, Player.y, Player.size, Player.size)
end

return Player
