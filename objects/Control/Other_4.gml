if spawn_room = -1 exit;
oPlayer.x = spawnX;
oPlayer.y = spawnY;

audio_stop_all();
if(room == rTest){
	audio_play_sound(DOOM,1,true);
}else{
	audio_play_sound(Shop,1,true);
}