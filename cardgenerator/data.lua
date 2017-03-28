bot = true;

id=1234567
-- link: usually 0
link=0
text = "Freedom Hero: Supertux";
stars = 4;
-- 2 - spell, 4 - trap, 17 - normal, 33 - effect, 65 - fusion, 97 - fusion + effect, 129 - ritual, 130 - spell ritual [for summon ritual monsters], 161 - ritual + effect, 545 - effect spirit, 673 - ritual effect spirit, 1057 - effect union, 2081 - effect gemini, 65538 - Spell Quick-Play, 131074 - Spell Continuous, 131076 - Trap Continuous, 262146 - Spell Equip, 524290 - Spell Field, 1048580 - Trap Counter, 2097185 - Effect Flip, 4194337 - Effect Toon
cardtype = 17;
eftext = "If this is the only card in your hand, you can Special Summon it. \n When this card is Summoned, if you control no other cards: you can draw 2 cards.";
atk = 800;
def = 1200;
-- 0 - traps and spells, 1 - warrior, 2 - spellcaster, 4 - fairy, 8 - fiend, 16 - zombie, 32 - machine, 64 - aqua, 128 - pyro, 256 - rock, 512 - winged beast, 1024 - plant, 2048 - insect, 4096 - Thunder, 8192 - Dragon, 16384 - Beast, 32768 - Beast Warrior, 65536 - Dinosaur, 131072 - Fish, 262144 - Sea Serpent, 524288 - Reptile, 1048576 - Psychic, 2097152 - Divine Beast, 4194304 - Creator God, 8388608 - Wyrm
type=1
-- 0 - trap; spell, 1 - earth, 2 - water, 4 - fire, 8 - wind, 16 - light, 32 - dark, 64 - divine
attribute=1

require("calc");