local config = {}

function config.telescope()
    require"modules.utils.telescope"
end

function config.neotree()
    require"modules.utils.neotree"
end

function config.toggleterm()
    require"modules.utils.toggleterm"
end

return config
