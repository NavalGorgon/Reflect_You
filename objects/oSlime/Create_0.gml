currentState = states.normal;
currentAttack = attacks.first; 
anim_length = 0;

direct = 1;

xSpeed = 0;
ySpeed = 0;
fSpeed = 6;
gSpeed = 0.2;

//hurtbox
hurtbox = hurtboxE_create(28,14,2,10);

//hitbox
hitbox = -1

hit = false;
hitStun = 0;
hitBy = -1;

//health
max_health = 20;
health_ = max_health;

//animation
x_frame = 0;
mySprite = sSlimeR;
spriteR = sSlimeR;
spriteL = sSlimeL;
 
idle = 1;
alarm[0] = 1;

//loot
loot_drop = false;
amoG = 1;
amoS = 3;
amoC = 5;
xp_drop = 15;

type = event.blue_death;