#!/bin/bash
stow -t ~ -R cli neptune

sudo chown root:root neptune-root -R
sudo stow -t / -R neptune-root
