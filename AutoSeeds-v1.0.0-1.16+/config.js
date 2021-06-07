//generated config
module.exports = {
  global: {
    "onBuildSuccess": null
  },
  mc: {
    dev: true,
    header: "#built using mc-build (https://github.com/mc-build/mc-build)",
    internalScoreboard: "LANG_MC_INTERNAL",
    generatedDirectory: "__generated__",
    rootNamespace: null,
		As: {
			soils:[
				{
					block: "minecraft:farmland",
					pos:"~ ~ ~"
				},
				{
					block: "minecraft:soul_sand",
					pos:"~ ~ ~"
				},
				{
					block: "#minecraft:dirt",
					pos:"~ ~-1 ~"
				}
			],
			seeds: [
				{
					tag: "snave.ps.potato",
					item:"minecraft:potato",
					block:"minecraft:potatoes",
					block_pos:"~ ~1 ~",
					soil:"minecraft:farmland",
					sound:"minecraft:item.crop.plant",
				},
				{
					tag: "snave.ps.wheat_seeds",
					item:"minecraft:wheat_seeds",
					block:"minecraft:wheat",
					block_pos:"~ ~1 ~",
					soil:"minecraft:farmland",
					sound:"minecraft:item.crop.plant",
				},
				{
					tag: "snave.ps.carrot",
					item:"minecraft:carrot",
					block:"minecraft:carrots",
					block_pos:"~ ~1 ~",
					soil:"minecraft:farmland",
					sound:"minecraft:item.crop.plant",
				},
				{
					tag: "snave.ps.pumpkin_seeds",
					item:"minecraft:pumpkin_seeds",
					block:"minecraft:pumpkin_stem",
					block_pos:"~ ~1 ~",
					soil:"minecraft:farmland",
					sound:"minecraft:item.crop.plant",
				},
				{
					tag: "snave.ps.melon_seeds",
					item:"minecraft:melon_seeds",
					block:"minecraft:melon_stem",
					block_pos:"~ ~1 ~",
					soil:"minecraft:farmland",
					sound:"minecraft:item.crop.plant",
				},
				{
					tag: "snave.ps.beetroot_seeds",
					item:"minecraft:beetroot_seeds",
					block:"minecraft:beetroots",
					block_pos:"~ ~1 ~",
					soil:"minecraft:farmland",
					sound:"minecraft:item.crop.plant",
				},
				{
					tag: "snave.ps.netherwart",
					item:"minecraft:nether_wart",
					block:"minecraft:nether_wart",
					block_pos:"~ ~1 ~",
					soil:"minecraft:soul_sand",
					sound:"minecraft:item.nether_wart.plant",
				},
				{
					tag: "snave.ps.sweet_berries",
					item:"minecraft:sweet_berries",
					block:"minecraft:sweet_berry_bush",
					block_pos:"~ ~ ~",
					soil:"#minecraft:dirt",
					sound:"minecraft:block.sweet_berry_bush.place",
				}
			]
		}
  }
}