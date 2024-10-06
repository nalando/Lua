

--初始設定
local physics = require("physics")
physics.start()
physics.setDrawMode("normal")
local physicsData = require("images").physicsData(1.0)

--設定場景
local background = display.newImageRect("world.jpg",320,480)
background.x = display.contentCenterX
background.y = display.contentCenterY

local Happy_cat_2 = display.newImageRect("cat2.jpg",120,120)
Happy_cat_2.x = display.contentCenterX
Happy_cat_2.y = display.contentCenterY - 100
physics.addBody(Happy_cat_2,physicsData:get("cat2"))

local floor = display.newRect(display.contentCenterX+150,display.contentCenterY,20,150)
floor.rotation = 90
physics.addBody(floor,"static",{density = 0.3, friction = 0.6})

local floor = display.newRect(display.contentCenterX-100,display.contentCenterY+200,20,200)
floor.rotation = 90
physics.addBody(floor,"static",{density = 0.3, friction = 0.6})

--導入素材

local Happy_cat = display.newImageRect("Happy_cat.jpg",100,117)
Happy_cat.x = display.contentCenterX
Happy_cat.y = display.contentCenterY - 200
physics.addBody(Happy_cat,physicsData:get("Happy_cat"))

--監聽事件
local function onKeyEvent(event)
    if (event.phase == "down" and event.keyName == "space") then
        Happy_cat:setLinearVelocity(0, -300)
        return true
    end
    if (event.phase == "down" and event.keyName == "r") then
        Happy_cat.x = display.contentCenterX
        Happy_cat.y = display.contentCenterY - 200
        return true
    end
end

local function myTouchListener( event )
    Happy_cat:setLinearVelocity(0, -300)
end

-- 添加鍵盤監聽器
Runtime:addEventListener("key", onKeyEvent)
Runtime:addEventListener( "touch", myTouchListener )