Switch = Class("Button")

function Switch:initialize(scene, shape, x, y)
    self.scene = scene
    self.shape = shape
    self.angle = 0
    if shape == "circle" then
        self.x, self.y, self.r = x, y, 32
        self.polygon = Polygon:new(self.shape, self.x, self.y, self.r)
    elseif shape == "rectangle" then
        self.x, self.y, self.w, self.h = x, y, 64, 64
        self.polygon = Polygon:new(self.shape, self.x, self.y, 64, 64)
    elseif shape == "thinrectangle" then
        self.x, self.y, self.w, self.h = x, y, 64, 32
        self.polygon = Polygon:new(self.shape, self.x, self.y, 64, 32)
    elseif shape == "minirectangle" then
        self.x, self.y, self.w, self.h = x, y, 32, 32
        self.polygon = Polygon:new(self.shape, self.x, self.y, 32, 32)
    end

    self.velocity = {0, 0, 0} -- x, y, spin
    self.gravity = 384

    self.state = false

    self.hovering = false
    self.clicking = false
    self.disabled = false
end

function Switch:update(dt)
    -- Move the Button
    self.x = self.x + (self.velocity[1] * dt)
    self.y = self.y + (self.velocity[2] * dt)
    self.velocity[2] = self.velocity[2] + self.gravity * dt
    self:rotate(self.velocity[3], dt)
    self.polygon:move(self.x,self.y)

    -- Check if the button is out of bounds
    if self.polygon:center()[2] > Env.height then
        self.DELETEME = true
    end
    if self.polygon:center()[1] < 0 then
        self.velocity[1] = -self.velocity[1]
    end
    if self.polygon:center()[1] > Env.width then
        self.velocity[1] = -self.velocity[1]
    end

    -- Check if the mouse is hovering the button
    local mx, my = love.mouse.getX()/Env.scale, love.mouse.getY()/Env.scale
    self.hovering = self.polygon:hover(mx, my)
    if (not self.hovering) and self.clicking then
        self.clicking = false
    end

    -- Check if the switch is in correct position
    if self.disabled then return end
    if self.polygon:center()[2] >= Env.height-self.scene.foregroundHeight-32 and self.velocity[2] > 0 then
        if self.state then
            self.scene:addScore(10,self)
        end
        self.disabled = true
    end
end

function Switch:getQuad()
    if self.disabled then return 4
    elseif self.clicking then return 3
    elseif self.hovering then return 2
    end
    return 1
end

function Switch:draw(shadow)
    local sx = 2
    if self.state then sx = -2 end
    -- Draw the Button
    local rot = math.rad(self.angle)
    local quad = self:getQuad()
    if not shadow then
        love.graphics.setColor(1,1,1)
    end
    love.graphics.draw(SwitchImg, SwitchQuad[self.shape][5], self.x, self.y, rot, sx, 2, 16, 16)
    love.graphics.draw(SwitchImg, SwitchQuad[self.shape][quad], self.x, self.y, rot, sx, 2, 16, 16)
end

function Switch:drawDebug()
    love.graphics.setColor(1,1,1)
    self.polygon:draw()
end

function Switch:click(mx, my, b)
    if b == 1 and not self.disabled then
        self.clicking = self.hovering
    end
end

function Switch:release(mx, my, b)
    if b == 1 and not self.disabled then
        if self.clicking and self.hovering then
            self.state = not self.state
        end
        self.clicking = false
    end
end

function Switch:rotate(angle, dt)
    self.angle = (self.angle + angle * dt) % 360
    self.polygon:rotate(angle * dt)
end