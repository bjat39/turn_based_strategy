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
            name: ini_read_string("Item" + string(i), "Name", ""),
            type: itemType
        };

        // Load weapon-specific data
        if (itemType == "Weapon") {
		item.weapontype = ini_read_string("Item" + string(i), "WeaponType", "");
		item.upperrange = ini_read_string("Item" + string(i), "UpperRange", "");
        item.might = ini_read_real("Item" + string(i), "Might", 0);
        item.hit = ini_read_real("Item" + string(i), "Hit", 0);
        item.crit = ini_read_real("Item" + string(i), "Crit", 0);
        item.durability = ini_read_real("Item" + string(i), "Durability", 0);
    }
    // Load consumable-specific data
    else if (itemType == "Consumable") {
        item.effect = ini_read_string("Item" + string(i), "Effect", "");
    }
    // Load key-specific data
    else if (itemType == "Key") {
        item.effect = ini_read_string("Item" + string(i), "Effect", "");
    }

    array_push(global.items, item);
}


// Close the INI file
ini_close();

room_goto(destination_room);