#!/bin/sh
echo "ZIP Files..."
tar cvf secrets.tar ./secrets

echo "Encrypted with travis"
## Encrypted with travis
travis encrypt-file ./secrets.tar