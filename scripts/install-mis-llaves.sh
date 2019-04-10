#!/bin/bash
cd
git clone https://bitbucket.org/mrdanbrooks/llaves.git mis\ llaves
cd mis\ llaves
git remote rename origin keyless
git remote add origin git@bitbucket.org:mrdanbrooks/llaves.git
