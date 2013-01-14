#!/bin/bash
echo "Adding 'chdan' command to $USER's .bashrc file"
echo "# [db] run dan's environment" >> ~/.bashrc
echo "alias chdan='source ~/.dan/.bashrc'" >> ~/.bashrc
