pkgs:

{
  coc = {
    enable = true;
    settings = ./coc-settings.json;
  };

  enable = true;
  vimAlias = true;

  extraConfig = ''
    luafile /etc/nixos/nvim/settings.lua
  '';

  plugins = with pkgs.vimPlugins; [
    # autocompletion
    coc-nvim

    # formatting
    vim-autoformat

    # linting
    ale

    # rust
    coc-rust-analyzer

    # python
    coc-pyright

    # web
    vim-prettier

    # nix
    vim-nix

    # lua
    coc-lua

    # make brackets nicer
    nvim-autopairs

    # colorize hex codes
    nvim-colorizer-lua

    # colorize brackets
    rainbow

    # theme
    dracula-vim
  ];
}
