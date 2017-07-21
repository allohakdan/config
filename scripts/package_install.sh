#!/bin/bash
source ../.parse_yaml.sh
eval $(parse_yaml packages.yml "config_")
echo  "$config_git_Linux"

for var in ${!config_@}; do
#     printf "%s%q\n" "$var=" "${!var}"
    printf "%q\n" "${!var}"
done

#compgen -v | grep "config_" | echo
# compgen -A variable | grep "config_" | 
