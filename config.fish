alias ll "ls -la"
alias vim "mvim -v"


# --------------------------- Golang Settings -------------------------------
# Install golang by `brew install go`
set -x GOROOT "/usr/local/Cellar/go/1.9.2/libexec"
set -x GOPATH "$HOME/go"
set PATH $PATH "$GOROOT/bin"
set PATH $PATH "$GOPATH/bin"

# --------------------------- Virtualenv Settings-------------------------------
# fish virtualenv python env
# http://virtualfish.readthedocs.io/en/latest/install.html#customizing-your-fish-prompt
eval (python -m virtualfish)
if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

# fish virtualenv settings
alias workon "vf activate"
alias freevir "vf deactivate"
alias mkvir "vf new"
alias delvir "vf rm"
alias showvir "vf ls"

