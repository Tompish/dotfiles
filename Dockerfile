FROM ubuntu:devel as Build

RUN apt-get update && apt-get install -y neovim

RUN apt-get install -y tmux && apt-get install -y curl
RUN apt-get install -y bat && apt-get install -y ripgrep && apt-get install -y fzf
RUN apt-get install -y gcc
RUN apt-get install -y dotnet-sdk-8.0
RUN apt-get install -y git
RUN git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim

#TMux plugin manager
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Fix bat, rename from batcat to bat
#RUN ln -s /usr/bin/batcat ~/.local/bin/bat
RUN mv /usr/bin/batcat /usr/bin/bat

#unzip only needed to unzip nerdfonts
RUN apt-get install -y unzip

#nerdfonts
RUN curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
RUN mkdir -p  "$HOME/.fonts"
RUN unzip "Hack.zip" -d "$HOME/.fonts/Hack/" 

#Starship, but remove the needed confirmation with sed
RUN curl -sS https://starship.rs/install.sh | sed 's/confirm "Install Starship .*//g' | sh

COPY rootfolders /root
