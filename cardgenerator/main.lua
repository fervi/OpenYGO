require("data");

-- Set card resolution
success = love.window.setMode( 354, 508 )

-- Add files to project
fontcardname = love.graphics.newFont("lmmonocaps10-regular.otf", 25)
fontcardtextbig = love.graphics.newFont("GoMonoRegular.ttf", 20)
gfx_bg = love.graphics.newImage("normalcards.png");
gfx_star = love.graphics.newImage("star.png");

function love.draw()
love.graphics.setColor( 255, 255, 255)
love.graphics.rectangle("fill", 0, 0, 354, 508)

-- border
love.graphics.setColor( 0, 0, 0)
love.graphics.rectangle("line", 0, 0, 354, 508)
love.graphics.setColor( 20, 20, 20)
love.graphics.rectangle("line", 1, 1, 353, 507)
love.graphics.setColor( 40, 40, 40)
love.graphics.rectangle("line", 2, 2, 352, 506)
love.graphics.setColor( 60, 60, 60)
love.graphics.rectangle("line", 3, 3, 351, 505)
love.graphics.setColor( 80, 80, 80)
love.graphics.rectangle("line", 4, 4, 350, 504)

-- add card background
love.graphics.draw(gfx_bg, 5, 5, 0, 0.435, 0.836, 0, 0)
love.graphics.setColor( 255, 255, 255)

-- add card name
love.graphics.setFont(fontcardname)
love.graphics.rectangle("line", 10, 10, 337, 30)
love.graphics.print(text, 12, 7)

-- add stars
if(cardtype==1)
then
love.graphics.setFont(fontcardtextbig)
love.graphics.draw(gfx_star, 320, 45, 0, 1, 1, 0, 0);
love.graphics.print(stars .. 'x', 290, 45)
end


end

screenshot = love.graphics.newScreenshot();
screenshot:encode("test.png", "png");