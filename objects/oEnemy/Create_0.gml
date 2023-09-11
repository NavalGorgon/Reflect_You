hurtbox = hurtboxE_create(32,32,0,0)

currentState = states.normal;
currentAttack = attacks.first; 
anim_length = 0;

direct = 1;

xSpeed = 0;
ySpeed = 0;
fSpeed = 6;
gSpeed = 0.25;
wSpeed = 3;

//hitbox
hitbox = -1

hit = false;
hitStun = 0;
hitBy = -1;

//health
max_health = 2000;
health_ = max_health;