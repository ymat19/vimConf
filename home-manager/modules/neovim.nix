{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # essentials
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      # buffer
      oil-nvim
      # ui
      tokyonight-nvim
      vim-airline
      hlchunk-nvim
      # movement
      quick-scope
      clever-f-vim
      neoscroll-nvim
      hardtime-nvim
      leap-nvim
      # visual
      vim-expand-region
      # util
      substitute-nvim
      nvim-surround
      dial-nvim
    ];
    extraLuaConfig = builtins.readFile ../configs/init.lua;
  };

  home.packages = lib.mkAfter (with pkgs; [
    nixd
  ]);
}
