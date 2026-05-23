switch (behavior_type) {
    case "fire":
		sprite_index = sButtonFire;
        break;
	case "wood":
		sprite_index = sButtonWood;
        break;
	case "cloner":
		sprite_index = sButtonCloner;
        break;
	case "antimatter":
		sprite_index = sButtonAntimatter;
        break;
	case "player":
		sprite_index = sButtonPlayer;
        break;
    default:
        // code here
        break;
}

draw_self()