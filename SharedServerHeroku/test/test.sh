#!/bin/bash
echo "Ejecutando test de status ...\n"
echo $(nosetests --verbosity=2 test/status/)
echo ""
echo "Ejecutando test de API ...\n"
echo $(nosetests --verbosity=2 test/api/)
