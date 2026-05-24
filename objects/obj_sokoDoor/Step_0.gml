isOpen = true;
solid = false;

for (var i = 0; i < instance_number(obj_boxSwitch); i++){
    var inst = instance_find(obj_boxSwitch, i);
	if (!inst.isBoxed) {
		isOpen = false;
		solid = true;
		return;
	}
}