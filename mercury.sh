#!/bin/bash
stow -t ~ -R cli mercury

sudo chown root:root mercury-root -R
sudo stow -t / -R mercury-root
