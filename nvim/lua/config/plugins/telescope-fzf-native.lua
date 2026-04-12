vim.pack.add({ "https://github.com/nvim-telescope/telescope-fzf-native.nvim" })

-- vim.pack does not yet have a way to do builds. You need to run make direcly
-- in the following directory.
--
-- /Users/gja22/.local/share/nvim-new/site/pack/core/opt/telescope-fzf-native.nvim
-- Will need to update this when I move this new config to nvim rather then
-- nvim-new
--
-- This was the old instruction from using the lazy package manager
-- {
--   "nvim-telescope/telescope-fzf-native.nvim",
--   build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
-- },
