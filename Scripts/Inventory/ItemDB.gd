extends Node
"""
Structure of item database:
	ITEM_NAME : {
		icon : icon_path (string)
		amount : 20 (int)
		index : 0 (int)
	}
"""
# Item textures (make class for this later)
# Seeds
var wheat_texture:Texture = preload("res://Assets/inv_icons/wheat_seed.png")
var melon_texture:Texture = preload("res://Assets/inv_icons/melon_seed.png")
var cyanide_texture:Texture = preload("res://Assets/inv_icons/cyanide.png")
var cock_texture:Texture = preload("res://Assets/inv_icons/cock_seed.png")
var turnip_texture:Texture = preload("res://Assets/inv_icons/turnip_seed.png")
# Crops
var wheatcrop_texture:Texture = preload("res://Assets/inv_icons/wheat_crop.png")
var meloncrop_texture:Texture = preload("res://Assets/inv_icons/melon_crop.png")
var cockcrop_texture:Texture = preload("res://Assets/inv_icons/cock_crop.png")
var turnipcrop_texture:Texture = preload("res://Assets/inv_icons/turnip_crop.png")
var equipped = null

"""
Search categories:
	SEEDS
	CROPS
"""
# Inventory/World item list
var ITEMS = {
		# *** SEEDS ****
	# Wheat seeds
	"WHEAT_SEED" : {
		"amount" : 3,
		"formal" : "WHEAT SEEDS",
		"texture" : wheat_texture,
		"usage" : "WITH RAKE EQUIPPED PRESS SPACE ON DIRT"
	}
	,
	# Melon seeds
	"MELON_SEED" : {
		"amount" : 0,
		"formal" : "MELON SEEDS",
		"texture" : melon_texture,
		"usage" : "WITH RAKE EQUIPPED PRESS SPACE ON DIRT"
	}
	,
	# Cock seeds
	"COCK_SEED" : {
		"amount" : 0,
		"formal" : "CARROT SEEDS",
		"texture" : cock_texture,
		"usage" : "WITH RAKE EQUIPPED PRESS SPACE ON DIRT"
	}
	,
	# Turnip seeds
	"TURNIP_SEED" : {
		"amount" : 0,
		"formal" : "TURNIP SEEDS",
		"texture" : turnip_texture,
		"usage" : "WITH RAKE EQUIPPED PRESSED SPACE ON DIRT"
	}
	,
	# *** CROPS ****
	# Wheat crop
	"WHEAT_CROP" : {
		"amount" : 0,
		"formal" : "WHEAT",
		"texture" : wheatcrop_texture,
		"usage" : "NONE"
	}
	,
	# Melon crop
	"MELON_CROP" : {
		"amount" : 0,
		"formal" : "MELON",
		"texture" : meloncrop_texture,
		"usage" : "NONE"
	}
	,
	# Cock crop
	"COCK_CROP" : {
		"amount" : 0,
		"formal" : "CARROT",
		"texture" : cockcrop_texture,
		"usage" : "NONE"
	}
	,
	# Turnip crop
	"TURNIP_CROP" : {
		"amount" : 0,
		"formal" : "TURNIP",
		"texture" : turnipcrop_texture,
		"usage" : "NONE"
	}
	,
	# Cyanide pills (temp)
	"CYANIDE" : {
		"amount" : 0,
		"formal" : "CYANIDE",
		"texture" : cyanide_texture,
		"usage" : "NONE"
	}
}

# *** SETTERS ***

# Set amount of item
func set_amount(item_name:String, amount:int) -> void:
	ITEMS.get(item_name)["amount"] = amount

# Set equipped
func set_equipped(item_name:String):
	equipped=item_name

# Increase amount of item by 1
func increase_amount(item_name:String):
	set_amount(item_name, get_amount(item_name)+1)

# Decrease amount of item by 
func decrease_amount(item_name:String):
	set_amount(item_name, get_amount(item_name)-1)

# *** GETTERS ***

# Check if there is an item equipped
func is_equipped() -> bool:
	if(equipped!=null):
		return true
	return false

# Check if given item is equipped
func is_this_equipped(item_name:String)->bool:
	if(item_name==equipped):
		return true
	return false

# Check if any of the given items in the array are equipped
func are_these_equipped(item_names:Array)->bool:
	if(equipped in item_names):
		return true
	return false

# Get currently equipped item
func get_equipped() -> String:
	return equipped

# Unequip anything already equipped
func unequip() -> void:
	equipped=null

# Get texture
func get_texture(item_name:String) -> Texture:
	return ITEMS.get(item_name).get("texture")

# Get a list of all items
func get_items() -> Array:
	var itemArray = []
	for item in ITEMS:
		itemArray.append(item)
	return itemArray

# Get amount of inputted item
func get_amount(item_name:String) -> int:
	return ITEMS.get(item_name).get("amount")

# Get formal name
func get_formal_name(item_name:String) -> String:
	return ITEMS.get(item_name).get("formal")

# Get usge
func get_usage(item_name:String) -> String:
	return ITEMS.get(item_name).get("usage")
