#!/bin/bash
echo "======================================================================"
echo "======================================================================"
echo "Ejecutando test de status ...\n"
echo $(nosetests --verbosity=2 python/status/)
echo "======================================================================"
echo "======================================================================"
echo "Ejecutando test de API ...\n"
echo $(nosetests --verbosity=2 python/api/)
