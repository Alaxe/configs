#!/bin/bash
stow -t ~ -R cli ssh neptune

sudo chmod a+x ~
sudo chown root:root neptune-root -R
sudo stow -t / -R neptune-root
