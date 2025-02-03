return {
	{ "numToStr/Comment.nvim" },

	{
		"mattn/emmet-vim",
		config = function()
			vim.g.user_emmet_leader_key = "<C-Z>" -- Configurar la tecla líder para Emmet
		end,
	},
}
