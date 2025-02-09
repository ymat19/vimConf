
{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-f";
    mouse = true;
    customPaneNavigationAndResize = true;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      bind v split-window -h
      bind s split-window -v
      bind x kill-pane
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded"
      bind f copy-mode
      #set-option -g default-terminal screen-256color
      #set -g terminal-overrides 'xterm:colors=256'​


      # https://qiita.com/mnishiguchi/items/b8526fecd69aa87d2f7e

      # OS が Linux の時は xsel を使う
      if-shell -b '[ "$(uname)" = "Linux" ]' {
        set -s copy-command "xsel --clipboard --input"
        display "using xsel as copy-command"
      }

      # OS が Darwin の時は pbcopy を使う
      if-shell -b '[ "$(uname)" = "Darwin" ]' {
        set -s copy-command "pbcopy"
        display "using pbcopy as copy-command"
      }

      # copy-pipe と競合する場合があるので無効化
      set -s set-clipboard off

      # コピーモード中に Vim 風に v で選択範囲を定める
      bind -Tcopy-mode-vi v send -X begin-selection

      # コピーモード中に Vim 風に y で選択範囲をヤンクしてコピーモードを終了する
      bind -Tcopy-mode-vi y send -X copy-pipe-and-cancel

      # マウスをドラッグして選択範囲を定め、それをヤンクしてコピーモードを終了する
      bind -Tcopy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel
    '';
  };
}
