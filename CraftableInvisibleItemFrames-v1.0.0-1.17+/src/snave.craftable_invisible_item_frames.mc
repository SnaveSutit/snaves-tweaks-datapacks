
function install {
	scoreboard objectives add snave.if.i dummy ["", {"text":"Craftable Invisible Item Frames ","color":"green"}, {"text":"Internal","color":"gold"}]
}

function uninstall {
	scoreboard objectives remove snave.if.i
}

entities item_frames {
	minecraft:item_frame
	minecraft:glow_item_frame
}

function clear_world_of_knowledge_books {
	execute as @a[tag=snave.just_crafted] at @s run{
		kill @e[type=item,distance=..10,nbt={Item:{id:"minecraft:knowledge_book"}}]
		tag @s remove snave.just_crafted
	}
}

recipe invisible_item_frame {
	"type": "crafting_shapeless",
	"ingredients":[
		{ "item":"minecraft:item_frame" },
		{ "item":"minecraft:glass_pane" }
	],
	"result":{ "item": "minecraft:knowledge_book" }
}

recipe invisible_glow_item_frame {
	"type": "crafting_shapeless",
	"ingredients":[
		{ "item":"minecraft:glow_item_frame" },
		{ "item":"minecraft:glass_pane" }
	],
	"result":{ "item": "minecraft:knowledge_book" }
}

dir recipes {
	advancement invisible_item_frame {
		"criteria": {
			"requirement": {
				"trigger": "minecraft:recipe_unlocked",
				"conditions": { "recipe": "snave.craftable_invisible_item_frames:invisible_item_frame" }
			}
		},
		"rewards": {
			"function": "snave.craftable_invisible_item_frames:recipes/invisible_item_frame",
			"loot": [ "snave.craftable_invisible_item_frames:recipes/invisible_item_frame" ]
		}
	}

	loot invisible_item_frame {
		"pools": [
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:item",
						"name": "minecraft:item_frame",
						"functions": [
							{
								"function": "minecraft:set_nbt",
								"tag": "{Enchantments:[{}],EntityTag:{Tags:[\"snave.if.invisible_item_frame\"]}}"
							},
							{
								"function": "minecraft:set_name",
								"name": {
									"text": "Invisible Item Frame",
									"color": "white",
									"italic": false
								}
							}
						]
					}
				]
			}
		]
	}

	function invisible_item_frame {
		recipe take @s snave.craftable_invisible_item_frames:invisible_item_frame
		advancement revoke @s only snave.craftable_invisible_item_frames:recipes/invisible_item_frame
		clear @s minecraft:knowledge_book
		tag @s add snave.just_crafted
		schedule function snave.craftable_invisible_item_frames:clear_world_of_knowledge_books 1t append
	}

	advancement invisible_glow_item_frame {
		"criteria": {
			"requirement": {
				"trigger": "minecraft:recipe_unlocked",
				"conditions": { "recipe": "snave.craftable_invisible_item_frames:invisible_glow_item_frame" }
			}
		},
		"rewards": {
			"function": "snave.craftable_invisible_item_frames:recipes/invisible_glow_item_frame",
			"loot": [ "snave.craftable_invisible_item_frames:recipes/invisible_glow_item_frame" ]
		}
	}

	loot invisible_glow_item_frame {
		"pools": [
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:item",
						"name": "minecraft:glow_item_frame",
						"functions": [
							{
								"function": "minecraft:set_nbt",
								"tag": "{Enchantments:[{}],EntityTag:{Tags:[\"snave.if.invisible_item_frame\"]}}"
							},
							{
								"function": "minecraft:set_name",
								"name": {
									"text": "Invisible Glow Item Frame",
									"color": "white",
									"italic": false
								}
							}
						]
					}
				]
			}
		]
	}

	function invisible_glow_item_frame {
		recipe take @s snave.craftable_invisible_item_frames:invisible_glow_item_frame
		advancement revoke @s only snave.craftable_invisible_item_frames:recipes/invisible_glow_item_frame
		clear @s minecraft:knowledge_book
		tag @s add snave.just_crafted
		schedule function snave.craftable_invisible_item_frames:clear_world_of_knowledge_books 1t append
	}

}

clock 1s {
	execute as @e[type=#snave.craftable_invisible_item_frames:item_frames,tag=snave.if.invisible_item_frame] run{
		execute store result score #invisible snave.if.i run data get entity @s Invisible
		execute store result score #count snave.if.i run data get entity @s Item.Count
		execute at @s if score #count snave.if.i matches 0 run particle minecraft:end_rod ~ ~ ~ .2 .2 .2 0 1 normal
		execute unless score #count snave.if.i = #invisible snave.if.i run{
			execute store result entity @s Invisible byte 1 run scoreboard players get #count snave.if.i
			execute if score #count snave.if.i matches 0 at @s run playsound minecraft:entity.item_frame.add_item block @a ~ ~ ~ 1 0.1
		}
	}
}
