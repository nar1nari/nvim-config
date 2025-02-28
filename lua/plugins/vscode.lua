return {
    'Mofiqul/vscode.nvim',
    config = function()
        require('vscode').setup({
            disable_nvimtree_bg = false,
        })
        require('vscode').load()
    end
}

