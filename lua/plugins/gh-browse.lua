return {
  -- dir = "/Users/petarpetrov/Projects/gh-browse.nvim"
  'ipetrovbg/nvim-gh-browse',
  lazy = false,
  config = function()
    require('gh-browse').setup()
  end
}
