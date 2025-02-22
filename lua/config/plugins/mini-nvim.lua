return { 
    'echasnovski/mini.nvim',
    version = '*' ,
    config = function()
        require("mini.surround").setup()
        require("mini.tabline").setup()
        require("mini.animate").setup()
        require("mini.move").setup()
        require("mini.completion").setup()
        require("mini.comment").setup()
        require("mini.indentscope").setup()
        require("mini.jump").setup()
        require("mini.jump2d").setup()
    end,
}

