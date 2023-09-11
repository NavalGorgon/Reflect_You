/*NOTES

*/

//movement
left = false;
right = false;
up = false;
down = false;
sheath = true;


currentState = states.normal;
xSpeed = 0;
ySpeed = 0;
wSpeed = 3;
sSpeed = 6;
fSpeed = 6;
jSpeed = -5;
gSpeed = 0.25;
aSpeed = 0.5;
dSpeed = 0.5;
direct = 1;


stam_drain = 0;
stam_regen = 1;
stam_count = 0;
regen = false;

//Animation
mySprite = sPlayerR;
x_frame = 0;

//hurtbox
hurtbox = hurtbox_create(17,30,17,6);

//hitbox
hitbox = -1

hit = false;
hitStun = 0;
hitBy = -1;

//attack
attack = false;
currentAttack = attacks.first;

//Dialogue
portrait_index = 7;
voice = sndVoice_1;
name = "Player";
radius = 8;
active_textbox = noone;
lastTalker = noone;

