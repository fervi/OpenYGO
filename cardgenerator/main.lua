require("data");
require("vars");
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
if(type==17)
then

local greyscale = gradient {
    direction = 'horizontal';
    {176, 176, 83};
    {165, 132, 51};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- spell
if((type==2 or type==130) or (type==65538 or type==131074)) or (type==262146 or type==524290)
then

local greyscale = gradient {
    direction = 'horizontal';
    {93, 161, 140};
    {64, 85, 70};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- trap
if((type==4 or type==131076) or type==1048580)
then

local greyscale = gradient {
    direction = 'horizontal';
    {205, 140, 170};
    {124, 66, 107};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- effect
if(((type==33 or type==545) or (type==1057 or type==2081)) or (type==2097185 or type==4194337))
then

local greyscale = gradient {
    direction = 'horizontal';
    {184, 133, 93};
    {168, 85, 51};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- fusion
if(type==65 or type==97)
then

local greyscale = gradient {
    direction = 'horizontal';
    {123, 76, 154};
    {103, 80, 122};
}

drawinrect(greyscale, 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

-- ritual
if(type==129 or type==161) or (type==673)
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


-- add level
if(((type==2 or type==130) or (type==65538 or type==131074)) or (type==262146 or type==524290) or ((type==4 or type==131076) or type==1048580))
then
if((type==2 or type==130) or (type==65538 or type==131074)) or (type==262146 or type==524290)
then
love.graphics.print('[SPELL CARD]', 97, 20)
end

if((type==4 or type==131076) or type==1048580)
then
love.graphics.print('[TRAP CARD]', 103, 20)
end
else
love.graphics.draw(gfx_star, 154, 24, 0, 0.5, 0.5, 0, 0);

if(level>9)
then
love.graphics.print(level .. 'x', 135, 20)
else
love.graphics.print(level .. 'x', 140, 20)
end

end

-- Add card attribute
if(attribute~=0)
then
love.graphics.print(attrname, 10, 20)
else

if(type==65538)
then
love.graphics.print("Quick-Play", 10, 20)
end

if(type==131074 or type==131076)
then
love.graphics.print("Continuous", 10, 20)
end

if(type==262146)
then
love.graphics.print("Equip", 10, 20)
end

if(type==524290)
then
love.graphics.print("Field", 10, 20)
end

if(type==1048580)
then
love.graphics.print("Counter", 10, 20)
end

end

-- Draw card sprite border
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 40, 155, 155)

-- Draw card text border
if(((type==2 or type==130) or (type==65538 or type==131074)) or (type==262146 or type==524290) or ((type==4 or type==131076) or type==1048580))
then
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 200, 155, 50)
else
love.graphics.rectangle("line", (resolution_x/2)-(155/2), 200, 155, 50)
love.graphics.rectangle("line", 139, 200, 27, 50)
end


-- Draw card text
love.graphics.setFont(fontcardtext)
if(((type==2 or type==130) or (type==65538 or type==131074)) or (type==262146 or type==524290) or ((type==4 or type==131076) or type==1048580))
then
love.graphics.printf(eftext, 12, 202, 150, "left")
else
love.graphics.printf("[ " .. racename .. " " .. typename .. " ]" .. "\n" .. eftext, 12, 202, 125, "left")
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
screenshot:encode('png', id..'.png');
love.filesystem.write("aaa", 'INSERT INTO "datas" VALUES('..id..',3,'..alias..',0,'..type..','..atk..','..def..','..level..','..race..','..attribute..',0);\n'.."INSERT INTO 'texts' VALUES("..id..",'"..text.."','"..eftext.."','','','','','','','','','','','','','','','','');\n")
love.event.push('quit')
end
end

end