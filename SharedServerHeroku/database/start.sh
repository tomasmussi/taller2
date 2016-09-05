#!/bin/bash
sudo su postgres -c "psql -U postgres < database/sharedserver.sql -W"
