#!/bin/bash
echo "=== Vérification du poste de Bagté Ariel ==="
echo
echo "Ubuntu :"
lsb_release -d
echo "Git :"
git --version
echo "Node.js :"
node --version
echo "npm :"
npm --version
echo "tree :"
tree --version
echo
echo "=== Fin de la vérification ==="
echo "Python :"
python3 --version
echo "Accès à GitHub :"
curl -sI https://github.com | head -n 1