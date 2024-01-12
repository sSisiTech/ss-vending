Config = {}

Config.Products = {
    Cola = {name = 'Cola', price = 2, itemname = 'kurkakola'},
    Sprunk = {name = 'Sprunk', price = 2, itemname = 'sprunk'},
    Coffee = {name = 'Coffee', price = 2, itemname = 'coffee', icon = 'fa-solid fa-mug-saucer'},

    -- OPTIONAL:
    -- icon = '<string>',
    -- amount = '<integer>',
}

Config.Vendings = {
    Cola = {
        modelhash = '992069095',
        modelname = 'prop_vend_soda_01',
        products = {
            'Cola',
            'Sprunk',
        }
    },
    Sprunk = {
        modelhash = '1114264700',
        modelname = 'prop_vend_soda_02',
        products = {
            'Sprunk',
            'Cola',
        }
    },
    Coffee = {
        modelhash = '690372739',
        modelname = 'prop_vend_coffe_01',
        products = {
            'Coffee',
        }
    },
    
    -- OPTIONAL:
    -- animDict = '<string>',
    -- anim = '<string>',
    -- flags = <integer>,
    -- duration = <integer>,
    -- distance = <integer>,
}
