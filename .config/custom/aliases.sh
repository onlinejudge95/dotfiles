git config --global alias.identity '! git config user.name "$(git config user.$1.name)"; git config user.email "$(git config user.$1.email)"; git config user.signingkey "$(git config user.$1.signingkey)"; :'

alias indi-astropi='indiserver indi_asi_ccd indi_pmc8_telescope'
