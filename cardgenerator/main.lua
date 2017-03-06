require("data");

-- Set card resolution
resolution_x = 354;
resolution_y = 508;
success = love.window.setMode( resolution_x, resolution_y )

-- Add files to project
fontcardname = love.graphics.newFont("fonts/lmmonocaps10-regular.otf", 25)
fontcardnamesmall = love.graphics.newFont("fonts/lmmonocaps10-regular.otf", 22)
fontcardtextbig = love.graphics.newFont("fonts/GoMonoRegular.ttf", 20)
fontcardtext = love.graphics.newFont("fonts/GoMonoRegular.ttf", 10)
gfx_star = love.graphics.newImage("sprites/star.png");
gfx_card = love.graphics.newImage("sprites/cardgraph.png");

function love.draw()
love.graphics.setColor(255, 255, 255)
love.graphics.rectangle("fill", 0, 0, 354, 508)

-- border
love.graphics.setColor(0, 0, 0)
love.graphics.rectangle("line", 0, 0, 354, 508)
love.graphics.setColor(20, 20, 20)
love.graphics.rectangle("line", 1, 1, 353, 507)
love.graphics.setColor(40, 40, 40)
love.graphics.rectangle("line", 2, 2, 352, 506)
love.graphics.setColor(60, 60, 60)
love.graphics.rectangle("line", 3, 3, 351, 505)
love.graphics.setColor(80, 80, 80)
love.graphics.rectangle("line", 4, 4, 350, 504)

-- add card background

if(cardtype==1)
then
love.graphics.setColor(185, 165, 75)
end

if(cardtype==2)
then
love.graphics.setColor(15, 129, 130)
end

if(cardtype==3)
then
love.graphics.setColor(122, 67, 96)
end

if(cardtype==4)
then
love.graphics.setColor(191, 116, 76)
end

if(cardtype==5)
then
love.graphics.setColor(135, 78, 159)
end

if(cardtype==6)
then
love.graphics.setColor(94, 110, 169)
end

love.graphics.rectangle("fill", 5, 5, 999, 999)
love.graphics.setColor(255, 255, 255)

-- add card name
love.graphics.setFont(fontcardname)
local font = love.graphics.getFont()
local width = font:getWidth(text)
love.graphics.rectangle("line", (resolution_x/2)-(310/2), 10, 310, 30)

if(width<300)
then
love.graphics.print(text, 25, 7)
else
love.graphics.setFont(fontcardnamesmall)
love.graphics.print(text, 25, 7)
end


-- add stars
if((cardtype==1 or cardtype==4) or (cardtype==5 or cardtype==6))
then
love.graphics.setFont(fontcardtextbig)
love.graphics.draw(gfx_star, 308, 45, 0, 1, 1, 0, 0);

if(stars>9)
then
love.graphics.print(stars .. 'x', 270, 46)
else
love.graphics.print(stars .. 'x', 278, 46)
end

end

if(cardtype==2)
then
love.graphics.print('[SPELL CARD]', 194, 42)
end

if(cardtype==3)
then
love.graphics.print('[TRAP CARD]', 206, 42)
end

-- Draw card sprite border
love.graphics.rectangle("line", (resolution_x/2)-(310/2), 80, 310, 310)

-- Draw card text border
love.graphics.rectangle("line", (resolution_x/2)-(310/2), 400, 310, 100)

-- Draw card test
love.graphics.setFont(fontcardtext)
love.graphics.printf(eftext, 25, 405, 300, "left")

-- Draw card graph
width = gfx_card:getWidth()
height = gfx_card:getHeight()
love.graphics.draw(gfx_card, (resolution_x/2)-(310/2)+1, 81, 0, (310-2)/width, (310-2)/height, 0, 0);

if(bot==true)
then
exists = love.filesystem.exists( 'xxx.png' )

if(exists==false)
then
exists = love.filesystem.exists( 'xxx.png' )
screenshot = love.graphics.newScreenshot();
screenshot:encode('xxx', 'png');
love.event.push('quit')
end
end

end

