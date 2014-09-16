-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar(display.HiddenStatusBar);

local width = display.contentWidth*0.5
local height = display.contentHeight*0.5

local physics = require "physics"
physics.start()

local background = display.newImage("Imagens/telaBackground.png",width,height)
local ponei = display.newImage("Imagens/poneiMarrom.png")
ponei.x = 300
ponei.y = 1200
local chao = display.newImage("Imagens/chao10.png", width, 1315)

physics.addBody(chao, "static")
physics.addBody(ponei)

local function onScreenTouch( event )
		if event.phase == "began" then
				ponei:applyForce(580, 1200, ponei.x, ponei.y)
				end
	end
	
	-- an image sheet with a cat
--local sheet1 = graphics.newImageSheet( "spriteponei2.png", { width=340, height=279, numFrames=8 } )

-- play 8 frames every 1000 ms
--local instance1 = display.newSprite( sheet1, { name="cat", start=1, count=8, time=1000 } )
--instance1.x = display.contentWidth / 4 + 40
--instance1.y = baseline - 75
--instance1.xScale = .5
--instance1.yScale = .5
--instance1:play()

	Runtime:addEventListener("touch", onScreenTouch)