#!/bin/bash
cli=c2
clu=idap

read -p 'Which container? ' ID
docker exec -ti $cli$clu$ID /bin/bash
