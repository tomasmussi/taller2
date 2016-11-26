#!/bin/bash
sudo su postgres -c "psql -U postgres < ../sharedserver.sql -W"
