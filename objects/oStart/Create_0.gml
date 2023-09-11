bx = x;
by = y;
bx2 = x+160;
by2 = y+32;
image_speed = 0;

t_scene_info = [
					[cutscene_transition, 1, room6, 416, 124],
					[cutscene_dialogue, 
						["Kaiya", 
						"...", 
						"Kaiya!", 
						"...", 
						"KAIYA!", 
						"...eh?", 
						"Get up, let's go!",
						"Let me sleep, Lukas.",
						"Come on, Hilda's about to start her story!",
						"Oh, you mean the story that you've heard a milion times?",
						"Please Kaiya?",
						"Alright, I'm coming."
						], 
						[oBrother, oPlayer, oBrother, oPlayer, oBrother, oPlayer, oBrother, oPlayer, oBrother, oPlayer, oBrother, oPlayer],
						[0,0,0,0,0,0,0,0,0,0,0,0],
						[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,],
						0
					],
					[cutscene_next_stage, quests.help_a_brother_out]
]