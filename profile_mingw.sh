#!/bin/bash
echo '. "$HOME/.profile.d/.bashrc"' > $HOME/.bashrc
echo '. "$HOME/.profile.d/.bash_profile"' > $HOME/.bash_profile
echo '. "$HOME/.profile.d/.bash_logout"' > $HOME/.bash_logout
echo '. "$HOME/.profile.d/.aliases"' > $HOME/.aliases
