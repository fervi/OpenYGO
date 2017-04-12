require("data");
require("gradient");
require("calc");

-- Set card resolution
resolution_x = 177;
resolution_y = 254;
success = love.window.setMode( resolution_x, resolution_y )

-- Add files to project
fontcardname = love.graphics.newFont("fonts/lmmonocaps10-regular.otf", 12)
fontcardnamesmall = love.graphics.newFont("fonts/lmmonocaps10-regular.otf", 1)
fontcardtextbig = love.graphics.newFont("fonts/GoMonoRegular.ttf", 10)
fontcardtext = love.graphics.newFont("fonts/GoMonoRegular.ttf", 5)
gfx_star = love.graphics.newImage("sprites/star.png");
gfx_card = love.graphics.newImage("sprites/cardgraph.png");

function love.draw()
love.graphics.setColor(255, 255, 255)
love.graphics.rectangle("fill", 0, 0, 177, 254)

-- border
love.graphics.setColor(0, 0, 0)
love.graphics.rectangle("line", 0, 0, 177, 254)
love.graphics.setColor(20, 20, 20)
love.graphics.rectangle("line", 1, 1, 176, 253)
love.graphics.setColor(40, 40, 40)
love.graphics.rectangle("line", 2, 2, 175, 252)
love.graphics.setColor(60, 60, 60)
love.graphics.rectangle("line", 3, 3, 174, 251)
love.graphics.setColor(80, 80, 80)
love.graphics.rectangle("line", 4, 4, 173, 250)

-- add card background

-- normal
if(cardtype==17)
then

local greyscale = gradient {
    direction = 'horizontal';
    {176, 176, 83};
    {165, 132, 51};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- spell
if((cardtype==2 or cardtype==130) or (cardtype==65538 or cardtype==131074)) or (cardtype==262146 or cardtype==524290)
then

local greyscale = gradient {
    direction = 'horizontal';
    {93, 161, 140};
    {64, 85, 70};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- trap
if((cardtype==4 or cardtype==131076) or cardtype==1048580)
then

local greyscale = gradient {
    direction = 'horizontal';
    {205, 140, 170};
    {124, 66, 107};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- effect
if(((cardtype==33 or cardtype==545) or (cardtype==1057 or cardtype==2081)) or (cardtype==2097185 or cardtype==4194337))
then

local greyscale = gradient {
    direction = 'horizontal';
    {184, 133, 93};
    {168, 85, 51};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- fusion
if(cardtype==65 or cardtype==97)
then

local greyscale = gradient {
    direction = 'horizontal';
    {123, 76, 154};
    {103, 80, 122};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- ritual
if(cardtype==129 or cardtype==161) or (cardtype==673)
then

local greyscale = gradient {
    direction = 'horizontal';
    {107, 117, 170};
    {65, 74, 91};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

love.graphics.setColor(255, 255, 255)

-- add card name
love.graphics.setFont(fontcardname)
local font = love.graphics.getFont()
local width = font:getWidth(text)
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 5, 155, 15)

if(width<300)
then
love.graphics.print(text, 12, 3)
else
love.graphics.setFont(fontcardnamesmall)
love.graphics.print(text, 12, 4)
end


-- add stars
if(((cardtype==2 or cardtype==130) or (cardtype==65538 or cardtype==131074)) or (cardtype==262146 or cardtype==524290) or ((cardtype==4 or cardtype==131076) or cardtype==1048580))
then
if((cardtype==2 or cardtype==130) or (cardtype==65538 or cardtype==131074)) or (cardtype==262146 or cardtype==524290)
then
love.graphics.print('[SPELL CARD]', 95, 24)
end

if((cardtype==4 or cardtype==131076) or cardtype==1048580)
then
love.graphics.print('[TRAP CARD]', 95, 24)
end
else
love.graphics.setFont(fontcardtextbig)
love.graphics.draw(gfx_star, 154, 24, 0, 0.5, 0.5, 0, 0);

love.graphics.setFont(fontcardtextbig)
if(stars>9)
then
love.graphics.print(stars .. 'x', 135, 24)
else
love.graphics.print(stars .. 'x', 140, 24)
end

end
--love.graphics.setFont(fontcardnamesmall)
-- Add card attribute
if(attribute~=0)
then

love.graphics.print(attrname, 10, 24)
else

if(cardtype==65538)
then
love.graphics.print("Quick-Play", 10, 24)
end

if(cardtype==131074 or cardtype==131076)
then
love.graphics.print("Continuous", 10, 24)
end

if(cardtype==262146)
then
love.graphics.print("Equip", 10, 24)
end

if(cardtype==524290)
then
love.graphics.print("Field", 10, 24)
end

if(cardtype==1048580)
then
love.graphics.print("Counter", 10, 24)
end

end

-- Draw card sprite border
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 40, 155, 155)

-- Draw card text border
if(((cardtype==2 or cardtype==130) or (cardtype==65538 or cardtype==131074)) or (cardtype==262146 or cardtype==524290) or ((cardtype==4 or cardtype==131076) or cardtype==1048580))
then
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 200, 155, 50)
else
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 200, 155, 50)
love.graphics.rectangle("line", 139, 200, 27, 50)
end


-- Draw card text
love.graphics.setFont(fontcardtext)
if(((cardtype==2 or cardtype==130) or (cardtype==65538 or cardtype==131074)) or (cardtype==262146 or cardtype==524290) or ((cardtype==4 or cardtype==131076) or cardtype==1048580))
then
love.graphics.printf(eftext, 12, 202, 150, "left")
else
love.graphics.printf("[ " .. typename .. " " .. cardtypename .. " ]" .. "\n" .. eftext, 12, 202, 125, "left")
love.graphics.setFont(fontcardtextbig)
love.graphics.printf("ATK:\n" .. atk .. "\nDEF:\n" .. def, 140, 202, 25, "left")
end

-- Draw card graph
width = gfx_card:getWidth()
height = gfx_card:getHeight()
love.graphics.draw(gfx_card, (resolution_x/2)-(155/2)+1, 40, 0, (155-2)/width, (155-2)/height, 0, 0);

if(bot==true)
then
exists = love.filesystem.exists( id..'.jpg' )

if(exists==false)
then
exists = love.filesystem.exists( id..'.jpg' )
screenshot = love.graphics.newScreenshot();
screenshot:encode(id..'.jpg', 'jpg');
love.filesystem.write("aaa", 'INSERT INTO "datas" VALUES('..id..',3,'..link..',0,'..cardtype..','..atk..','..def..','..stars..','..type..','..attribute..',0);\n'.."INSERT INTO 'texts' VALUES("..id..",'"..text.."','"..eftext.."','','','','','','','','','','','','','','','','');\n")
love.event.push('quit')
end
end

end