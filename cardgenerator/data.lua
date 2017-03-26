bot = true;

text = "Freedom Hero: Supertux";
stars = 4;
-- 1 - monster, 2 - spell, 3 - trap, 4 - effect, 5 - fusion, 6 - ritual
-- card type (2 - spell, 4 - trap, 17 - normal, 33 - effect, 65 - fusion, 97 - fusion + effect, 129 - ritual, 130 - spell ritual [for summon ritual monsters], 161 - ritual + effect, 545 - effect spirit, 673 - ritual effect spirit, 1057 - effect union, 2081 - effect gemini, 4113 - Tuner, 4129 - Effect Tuner, 5153 - Effect Union Tuner, 8193 - Synchro, 8225 - Effect Synchro, 12321 - Effect Synchro Tuner, 16385 - Token, 16401 - Token, 65538 - Spell Quick-Play, 131074 - Spell Continuous, 131076 - Trap Continuous, 262146 - Spell Equip, 524290 - Spell Field, 1048580 - Trap Counter, 2097185 - Effect Flip, 2101281 - Effect Tuner Flip, 4194337 - Effect Toon, 8388609 - XYZ, 8388641 - XYZ Effect, 16777233 - Pendulum, 16777249 - Pendulum Effect, 16777313 - Pendulum Effect Fusion, 16781345 - Pendulum Effect Tuner, 16785441 - Pendulum Effect Synchro, 18874401 - Pendulum Effect Flip, 25165857 - XYZ Pendulum Effect)
cardtype = 4;
eftext = "If this is the only card in your hand, you can Special Summon it. \n When this card is Summoned, if you control no other cards: you can draw 2 cards.";
atk = 800;
def = 1200;
-- 0 - traps and spells, 1 - warrior, 2 - spellcaster, 4 - fairy, 8 - fiend, 16 - zombie, 32 - machine, 64 - aqua, 128 - pyro, 256 - rock, 512 - winged beast, 1024 - plant, 2048 - insect, 4096 - Thunder, 8192 - Dragon, 16384 - Beast, 32768 - Beast Warrior, 65536 - Dinosaur, 131072 - Fish, 262144 - Sea Serpent, 524288 - Reptile, 1048576 - Psychic, 2097152 - Divine Beast, 4194304 - Creator God, 8388608 - Wyrm
type=1

require("calc");
require("cardtype");