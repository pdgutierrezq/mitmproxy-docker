#!/usr/bin/env bash
CLOSURE=$(base64 "closure.sh")
EXECUTE=$(base64 "execute.sh")
echo "{\"job\": {\"execute\": \"$EXECUTE\",\"closure\":\"$CLOSURE\"}}" > old.json

