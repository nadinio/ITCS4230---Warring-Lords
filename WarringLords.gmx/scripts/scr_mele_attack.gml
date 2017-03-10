global.damage_dealt = irandom(attack);
global.enemy.defence -= global.damage_dealt;

instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);


global.attacking = false;
