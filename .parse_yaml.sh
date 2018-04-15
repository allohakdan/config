#!/bin/sh
# https://gist.github.com/pkuczynski/8665367
#
#config.yml: 
#-----------
#  development:
#    adapter: mysql2
#    encoding: utf8
#    database: my_database
#    username: root
#    password:
#
# $(parse_yaml config.yml "prefix_")
# echo $config_development_database
#
# Find all variables for Linux
# export $(parse_yaml config.yml "config_")
# compgen -A variable | grep "config_.*_Linux"
parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

parse_yaml_test() {
  echo "howdy"
}

# Dans Version - filter for the platform version and only return those
filter_yaml() {
   local prefix=$2
   local platform=$3
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs -v pform=$platform '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {
        if (i > indent) {
          delete vname[i]
        }
      }
      if (length($3) > 0) {
         vn=""; 
         for (i=0; i<indent; i++) {
           vn=(vn)(vname[i])("_")
         }
         if(pform == $2){
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
       }
      }
   }'
}


