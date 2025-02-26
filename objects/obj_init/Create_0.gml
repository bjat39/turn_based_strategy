/// @description Set up global items, traits, abilities, rooms?
destination_room = rm_big_test_room;

// Load weapon data from the INI file
// Open the INI file
ini_open("items.ini");

// Load item data from the INI file
global.items = [];
for (var i = 1; i <= 29; i++) {
        var itemType = ini_read_string("Item" + string(i), "Type", "");
        var item = {
            name1: ini_read_string("Item" + string(i), "Name", ""),
            type: itemType,
			description: ini_read_string("Item" + string(i), "Description", "")
        };

        // Load weapon-specific data
        if (itemType == "Weapon") {
		item.weapontype = ini_read_string("Item" + string(i), "WeaponType", "");
		item.upperrange = ini_read_real("Item" + string(i), "UpperRange", 0);
        item.might = ini_read_real("Item" + string(i), "Might", 0);
        item.hit = ini_read_real("Item" + string(i), "Hit", 0);
        item.crit = ini_read_real("Item" + string(i), "Crit", 0);
        item.durability = ini_read_real("Item" + string(i), "Durability", 0);
    }
    // Load consumable-specific data
    else if (itemType == "Consumable") {
        
    }
    // Load key-specific data
    else if (itemType == "Key") {
        //item.effect = ini_read_string("Item" + string(i), "Effect", "");
    }

    array_push(global.items, item);
}


// Close the INI file
ini_close();

ini_open("trait.ini");

// Load item data from the INI file
global.traits = [];
for (var i = 1; i <= 4; i++) {
        var trait = {
            name: ini_read_string("Trait" + string(i), "Name", ""),
			description: ini_read_string("Trait" + string(i), "Description", "")
        };
    array_push(global.traits, trait);
}

// Close the INI file
ini_close();

global.abilities = [];
ini_open("abilities.ini");

for (var i = 1; i <= 29; i++) {
    var ability = {
        name: ini_read_string("Ability" + string(i), "Name", ""),
        type: ini_read_string("Ability" + string(i), "Type", ""),
		upperrange: ini_read_string("Ability" + string(i), "UpperRange", ""),
		maxuses: ini_read_string("Ability" + string(i), "MaxUses", ""),
		currentuses: ini_read_string("Ability" + string(i), "CurrentUses", ""),
		description: ini_read_string("Ability" + string(i), "Description", "")
    };
	array_push(global.abilities, ability);
}

ini_close();

room_goto(destination_room);