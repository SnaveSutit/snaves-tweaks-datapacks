
function install {
	scoreboard objectives add snave.As.i dummy ["",{"text":"Auto Seeds ","color":"green"},{"text":"Internal","color":"gold"}]
	scoreboard objectives add snave.As.seed dummy ["",{"text":"Auto Seeds ","color":"green"},{"text":"Seed ID","color":"gold"}]
	scoreboard objectives add snave.As.timer dummy ["",{"text":"Auto Seeds ","color":"green"},{"text":"Timer","color":"gold"}]
	scoreboard objectives add snave.As.config dummy ["",{"text":"Auto Seeds ","color":"green"},{"text":"Config","color":"gold"}]

	scoreboard players set $planting_time snave.As.config 10

	tellraw @a ["",{"text":"✔ Successfully Installed","color":"gold"},{"text":" Auto Seeds ","color":"green"},{"text":"\n→ Developed by ","color":"green"},{"text":"SnaveSutit","color":"red"}]
}

function uninstall {
	scoreboard objectives remove snave.As.i
	scoreboard objectives remove snave.As.seed
	scoreboard objectives remove snave.As.timer
	scoreboard objectives remove snave.As.config

	tellraw @a ["",{"text":"☠ Successfully Uninstalled","color":"red"},{"text":" Auto Seeds ","color":"green"},{"text":"\n→ Developed by ","color":"green"},{"text":"SnaveSutit","color":"red"}]
}

clock 5s {
	execute as @e[type=item,tag=!snave.As.checked] run{
		# Set seed id based on item id
		LOOP(config.As.seeds, seed) {
			execute if entity @s[nbt={Item:{id:"<%seed.item%>"}}] run{
				tag @s add <%seed.tag%>
				tag @s add snave.As.is_seed
			}
		}
		tag @s add snave.As.checked
	}
	execute as @e[type=item,tag=snave.As.is_seed] at @s if block ~ ~1 ~ #minecraft:air run{

		LOOP(config.As.soils, soil){
			execute if block <%soil.pos%> <%soil.block%> run{
				scoreboard players add @s snave.As.timer 1
				particle minecraft:happy_villager ~ ~.3 ~ .1 .1 .1 1 3 normal
				execute align xz positioned ~.5 ~ ~.5 run tp @s ~ ~ ~

				execute if score @s snave.As.timer >= $planting_time snave.As.config run{
					LOOP(config.As.seeds, seed){
						!IF(seed.soil === soil.block){
							execute if entity @s[tag=<%seed.tag%>] run{
								setblock <%seed.block_pos%> <%seed.block%>
								particle item <%seed.item%> ~ ~.3 ~ 0 0 0 0.05 10 normal
								playsound <%seed.sound%> block @a ~ ~ ~ 1 1
							}
						}
					}
					kill @s
				}
			}
		}
	}
}
