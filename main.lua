-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--Escondendo StatusBar 
display.setStatusBar(display.HiddenStatusBar);


-- variáveis para retornar o centro da tela
local width = display.contentWidth*0.5
local height = display.contentHeight*0.5

--Adicionando a boblioteca de física
local physics = require "physics"
physics.start()


--Declarando as imagens
local backgroundCeu = display.newImage("Imagens/backgroundCeu.png",width,height)
local backgroundGrama = display.newImage( "Imagens/backgroundGrama.png", width, 260)
local backgroundChao = display.newImage("Imagens/backgroundChao.png", width, 315)
local arvore = display.newImage( "Imagens/arvoreP.png", 480, 180)


--arvore:translate( width , height )


--Sprite do Ponei
local sheet1 = graphics.newImageSheet( "Imagens/ponySpriteM.png", { width=128, height=104, numFrames=8 } )

-- Posição e velocidade do Sprite
local instance1 = display.newSprite( sheet1, { name="correndo", start=1, count=8, time=1000 } )
instance1.x = 90
instance1.y = 260
instance1:play()

-- Física nos objetos [chão e sprite do ponei]
physics.addBody(backgroundChao, "static")
physics.addBody(instance1)

--função trouch para salto do ponnei
local function onScreenTouch( event )
		if event.phase == "began" then
				instance1:applyForce(0, 50, instance1.x, instance1.y)
				end
	end

local tPrevious = system.getTimer()

local function mover( event )

	local tDelta = event.time - tPrevious
	tPrevious = event.time

	local xOffset = ( 0.1 * tDelta )
	arvore.x = arvore.x - xOffset

	if (arvore.x + arvore.contentWidth) < 0 then
		arvore:translate( 480 * 2, 0)
	end
	-- body
end


--acionamento do evento "touch"
Runtime:addEventListener("touch", onScreenTouch)
Runtime:addEventListener( "enterFrame", mover );
