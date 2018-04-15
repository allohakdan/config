#!/bin/bash
source ../.parse_yaml.sh
# eval $(parse_yaml packages.yml "config_")
eval $(filter_yaml packages.yml "config_" "Darwin")
echo  "$config_git_Linux"
echo "$config_vim_Raspbian8"

echo "--------------"
for var in ${!config_@}; do
    printf "%s%q\n" "$var=" "${!var}"
    printf "%q\n" "${!var}"
done

# TODO write a new version of parse_yaml that filters for the platform name and only returns those variables.


#compgen -v | grep "config_" | echo
# compgen -A variable | grep "config_" | 
