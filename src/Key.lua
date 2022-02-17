--[[ 
    Represents a powerup that the player can collect, and use to either spawn more balls or unlock locked bricks.
    depending on which powerup spawns.
]]
Key = Class{}

function Key:init()
    -- Simple dimensions for collision
    self.width = 8
    self.height = 8
    -- Variable used to drop the powerup from the bricks.
    self.inPlay = false
    -- Simple positional placements and physics.
    self.x = -20
    self.y = -20
    self.dy = 50
end


function Key:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end


function Key:reset()
    self.inPlay = false
    self.x = -20
    self.y = -20
end

function Key:update(dt)
    -- Physics for powerup when in play
    self.y = self.y + self.dy * dt
    if self.y >= 250 then
        self.inPlay = false
        self.x = -20
        self.y = -20
    end
    
end

function Key:render()
    love.graphics.draw(gTextures['main'], gFrames['key'][4],
        self.x, self.y)
    
end