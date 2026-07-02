function beyond_the_clouds:debug/log {message:"common/entity_prepare"}

# clear tags from all entities in both dimensions
function beyond_the_clouds:common/clear_all_transfer_tags

# mark @s as current entity to be transferred
tag @s add btc.transfer_entity
