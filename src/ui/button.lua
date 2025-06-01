local Button = {}
Button.__index = Button

local allButtons = {}

function Button:new(config)
	local btn = setmetatable({}, Button)
	btn.x = config.x or 0
	btn.y = config.y or 0
	btn.width = config.width or 100
	btn.height = config.height or 50
	btn.text = config.text or ""
	btn.bgColor = config.bgColor or { 0.8, 0.8, 0.8 }
	btn.image = config.image or nil
	btn.font = config.font or love.graphics.getFont()
	btn.onClick = config.onClick or function() end
	btn.onHover = config.onHover or function() end
	btn.hovered = false
	table.insert(allButtons, btn)
	return btn
end

function Button:update(dt)
	local mx, my = love.mouse.getPosition()
	self.hovered = mx >= self.x and mx <= self.x + self.width and my >= self.y and my <= self.y + self.height
end

function Button:draw()
	if self.image then
		love.graphics.setColor(1, 1, 1)
		local imgW, imgH = self.image:getWidth(), self.image:getHeight()
		local scaleX = self.width / imgW
		local scaleY = self.height / imgH
		love.graphics.draw(self.image, self.x, self.y, 0, scaleX, scaleY)
	else
		if self.hovered then
			self.onHover()
		else
			love.graphics.setColor(self.bgColor)
		end
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 12, 12)
	end

	-- Draw text
	love.graphics.setFont(self.font)
	local textWidth = self.font:getWidth(self.text)
	local textHeight = self.font:getHeight()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(self.text, self.x + (self.width - textWidth) / 2, self.y + (self.height - textHeight) / 2)
end

-- Update all buttons
function Button.updateAll(dt)
	for _, btn in ipairs(allButtons) do
		btn:update(dt)
	end
end

-- Draw all buttons
function Button.drawAll()
	for _, btn in ipairs(allButtons) do
		btn:draw()
	end
end

-- Handle mousepress for all buttons
function Button.mousepressed(x, y, mouseButton)
	for _, btn in ipairs(allButtons) do
		if btn.hovered and mouseButton == 1 then
			btn.onClick()
		end
	end
end

return Button
