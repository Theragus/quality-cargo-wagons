-- Quality Cargo Wagons by Theragus
-- Scales train cargo wagon capacity with quality

local function apply_quality_scaling_to_wagons()
  -- Apply to base and modded cargo wagons.
  for name, prototype in pairs(data.raw["cargo-wagon"]) do
    prototype.quality_affects_inventory_size = true
  end
end

apply_quality_scaling_to_wagons()