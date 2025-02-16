/// @description Set up global items, traits, abilities, rooms?
function LoadWeaponData() {
    // Load weapon data from the INI file
    global.weapons = [];
    for (var i = 1; i <= 12; i++) {
        var weapon = {
            name: ini_read_string("Weapon" + string(i), "Name", ""),
            type: ini_read_string("Weapon" + string(i), "Type", ""),
            might: ini_read_real("Weapon" + string(i), "Might", 0),
            hit: ini_read_real("Weapon" + string(i), "Hit", 0),
            crit: ini_read_real("Weapon" + string(i), "Crit", 0),
            weight: ini_read_real("Weapon" + string(i), "Weight", 0),
            durability: ini_read_real("Weapon" + string(i), "Durability", 0)
        };
        array_push(global.weapons, weapon);
    }
}