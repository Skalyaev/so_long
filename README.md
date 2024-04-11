# So Long
> *Ce projet est un jeu 2D simple conçu pour vous familiariser avec l'utilisation de textures, de sprites et quelques éléments de gameplay de base.*

Il est temps de vous lancer dans votre premier projet graphique ! "So Long" vous fournira des bases dans les compétences suivantes : gestion de fenêtre, gestion des événements, choix de couleurs et de textures.

Vous allez maintenant prendre en main la bibliothèque graphique de l'école : la MiniLibX ! Cette bibliothèque, développée en interne, inclut des outils basiques pour ouvrir une fenêtre, créer des images et gérer des événements clavier et souris.

Les objectifs de ce projet sont similaires à ceux de votre première année : faire preuve de rigueur, améliorer vos compétences en programmation C, utiliser des algorithmes basiques, rechercher des informations de manière autonome,

## Preview
![](https://github.com/Skalyaeve/images-1/blob/main/screenshot/solong.gif)

## Install
```bash
sudo apt update -y
sudo apt install -y unzip
sudo apt install -y gcc
sudo apt install -y make
sudo apt install -y libxext-dev
sudo apt install -y libx11-dev
sudo apt install -y libbsd-dev
```
```bash
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share
mkdir -p $HOME/.local/src
mkdir -p $HOME/.local/include
```
```bash
link=Skalyaeve/so_long
name=solong

git clone https://github.com/$link.git $name
cd $name && unzip mlx && make && make clean

ln -s $PWD/$name $HOME/.local/bin/$name
ln -s $PWD/resource $HOME/.local/share/$name
ln -s $PWD/src $HOME/.local/src/$name
ln -s $PWD/include $HOME/.local/include/$name
```

## Usage
```bash
export PATH=$HOME/.local/bin:$PATH
solong <map>
```

## Uninstall
```bash
name=solong

rm -r $name
rm $HOME/.local/bin/$name
rm $HOME/.local/share/$name
rm $HOME/.local/src/$name
rm $HOME/.local/include/$name
```
