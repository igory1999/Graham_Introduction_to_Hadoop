#!/bin/bash

perl  -pe 's/XYZ/$ENV{"USER"}/g' commands.template > commands
perl  -pe 's/XYZ/$ENV{"USER"}/g' commands.sql.template > commands.sql
