function _fzf_change_directory
  fzf "$argv" | read foo
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function fzf_change_directory
  cd (
    begin
        ls -d $HOME/.config
        ls -d $HOME/Documents/HYPR/
        ghq list -p
        ls -ad $HOME/Repos/*/* |grep -v \.git
    end | fzf
  )

  commandline -r ' '
  commandline -f repaint
end
