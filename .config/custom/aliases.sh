git config --global alias.identity '! git config user.name "$(git config user.$1.name)"; git config user.email "$(git config user.$1.email)"; git config user.signingkey "$(git config user.$1.signingkey)"; :'

alias indi-astropi='nohup indiserver indi_asi_ccd indi_asi_focuser indi_pmc8_telescope &'
