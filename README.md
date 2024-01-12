# ss-vending
 A FiveM resource that adds working vending machines to your server.

 ## Requirements
 * QBCore
 * [ox_target](https://github.com/overextended/ox_target)
 * [progressbar](https://github.com/qbcore-framework/progressbar)

## Installation
* Download ss-vending
* Place the folder inside your resources folder
* remove -main from ss-vending-main
* add `ensure ss-vending` to your server.cfg

## Configuration
The script is very easy to modify and requires 0 coding knowledge.

### Adding products
You can configure your products in the `config.lua` at `Config.Products`.

you can add a new product like this:
```
Cola = {name = 'Cola', price = 2, itemname = 'kurkakola'},
```

#### Options
* `name` (name of the product)
* `price` (price of the product)
* `itemname` (name of item that the player gets when buying the product, can be found at `qb-core/shared/items.lua`
* `icon` [OPTIONAL] (the icon shown in the ox_target menu, example: `fa-solid fa-mug-saucer`) (Icons can be found [here](https://fontawesome.com/))
* `amount` [OPTIONAL] (the amount of items you get from ONE purshase)

### Adding Vendings
You can configure your vendings in the `config.lua` at `Config.Vendings`.

you can add a new vending like this:
```
    Cola = {
        modelhash = '992069095',
        modelname = 'prop_vend_soda_01',
        products = {
            'Cola',
            'Sprunk',
        }
    },
```

#### Options
* `modelhash` (the hash value of model) ([find here](https://gta-objects.xyz/objects))
* `modelname` (the name of the model) ([find here](https://gta-objects.xyz/objects))
* `products` (a list of the products sold in this vending machine) (product names should be in ' ' and seperated by ,)

NOTE: the list of products do not contain the name values of the products but the actual name in the Confg (shown in **bold** below):


**Cola** = {name = 'Cola', price = 2, itemname = 'kurkakola'}

##### Optional:
* `animDict` (value can be found [here](https://forge.plebmasters.de/animations))
* `anim` (value can be found [here](https://forge.plebmasters.de/animations))
* `flags`
* `duration` (duration of the progressbar)
* `distance` (minimum distance to be able to interact with the vending)

### Complete Example
You can add as many vending machines and products as you want, and you are not limited to jsut vending machines.

to show that I will add a newspaper "vending machine".

We will be using this model:

![Screenshot 2024-01-12 at 11-35-27 Search news GTA V object model IDs with images](https://github.com/sSisiTech/ss-vending/assets/127330857/56b4e386-148b-444f-89e4-429ed889944b)

#### Config.Products

I chose to charge $1 for the newspaper, usually these are free.

```
Newspaper = {name = 'Newspaper', price = 1, itemname = 'newspaper', icon = 'fa-solid fa-newspaper'},
```

#### Config.Vendings

I have not added in the animation because I couldn't find an animation for this.

```
    Newspaper = {
        modelhash = '261193082',
        modelname = 'prop_news_disp_02e',
        animDict = '',
        anim = '',
        products = {
            'Newspaper',
        }
    },
```

