#!/bin/bash

perl  -pe 's/XYZ/$ENV{"USER"}/g' commands.template > commands
