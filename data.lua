-- Quality Cargo Wagons by Theragus
-- Scales train cargo wagon capacity with quality

local function apply_quality_scaling_to_wagons()
  -- Get base game cargo wagon
  local cargo_wagon = data.raw["cargo-wagon"]["cargo-wagon"]
  
  if cargo_wagon then
    -- Enable quality for cargo wagons
    cargo_wagon.quality_affects_inventory_size = true
    
    -- Configure quality scaling multipliers according to requirements
    cargo_wagon.inventory_size_modifier_per_quality_tier = {
      -- Normal: Base quality (no change)
      [1] = 0.0,
      -- Uncommon: +30% bonus
      [2] = 0.3, 
      -- Rare: +60% bonus
      [3] = 0.6,
      -- Epic: +90% bonus
      [4] = 0.9,
      -- Legendary: +150% bonus  
      [5] = 1.5
    }
    
    -- Make sure the wagon is quality-enabled
    cargo_wagon.enable_quality = true
  end
  
  -- Apply the same modifications to modded cargo wagons if they exist
  for name, prototype in pairs(data.raw["cargo-wagon"]) do
    if name ~= "cargo-wagon" then
      prototype.quality_affects_inventory_size = true
      prototype.inventory_size_modifier_per_quality_tier = {
        [1] = 0.0,  -- Normal
        [2] = 0.3,  -- Uncommon
        [3] = 0.6,  -- Rare
        [4] = 0.9,  -- Epic
        [5] = 1.5   -- Legendary
      }
      prototype.enable_quality = true
    end
  end
end

apply_quality_scaling_to_wagons()