extends Node

func find_unique_name(parent: Node, prefix: String = '') -> String:
	var unique_name: String
	while true:
		unique_name = random_name(prefix)
		if not parent.has_node(unique_name):
			break
	return unique_name

func random_name(prefix: String) -> String:
	return prefix + str(randi())
