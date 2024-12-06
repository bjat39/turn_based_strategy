/// @description 
event_inherited(); //do the parent's inherited create event (par_actor), then our create event

faction = "ally"; //what side they are affliliated with, affects turn order
ai_type = "path";
description = "An enemy.";

//neft = enemy to aleneti, strucain, friend to ally
//aleneti = enemy to neft, strucain, ally
//strucian = enemy to neft, aleneti, ally
//ally = enemy to aleneti, strucian, friend to neft