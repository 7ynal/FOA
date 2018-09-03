//Button Check
a_held = keyboard_check(ord("A"));
w_held = keyboard_check(ord("W"));
d_held = keyboard_check(ord("D"));
s_held = keyboard_check(ord("S"));

space_tapped = keyboard_check_pressed(vk_space);

//Calc Movement
var moveX = d_held - a_held;
hsp = moveX * walksp;

//check floor
on_floor = place_meeting(x,y+1,o_Wall);

//hor collision
if(place_meeting(x+hsp,y,o_Wall)){
	while(!place_meeting(x+sign(hsp),y,o_Wall)){
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

//ver collision
if(space_tapped && on_floor){
	vsp += jump;
}
vsp += grv;
if(place_meeting(x,y+vsp,o_Wall)){
	while(!place_meeting(x,y+sign(vsp),o_Wall)){
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//Animation

if(!place_meeting(x,y+1,o_Wall)){
	sprite_index = s_Player_Air;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 1; else image_index = 0;
}else{
	image_speed = 1;
	if(hsp == 0){
		sprite_index = s_Player;
	}else{
		sprite_index = s_Player_Run;
		image_xscale = sign(hsp);
	}
}


