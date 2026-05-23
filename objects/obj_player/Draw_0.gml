depth = -1000;

switch (behavior_type) {
    case "wood":
        image_index = 1;
        break;
	case "fire":
        image_index = 2;
        break;
	case "cloner":
        image_index = 3;
        break;
	case "antimatter":
		image_index = 4;
		break;
    default:
        image_index = 0;
        break;
}

draw_self();
