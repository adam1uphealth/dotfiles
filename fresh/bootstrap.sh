# Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Fish
brew install fish
fish
command -s fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
