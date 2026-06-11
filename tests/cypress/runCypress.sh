#!/bin/bash

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
 else
  echo "No se encontró el archivo .env"
  exit 1
fi

if [ -z "$PATH_WORK_PROJECT" ]; then
  echo "La variable PATH_WORK_PROJECT no está definida"
  exit 1
fi

if [ -z "$PATH_SPECS" ]; then
  echo "La variable PATH_SPECS no está definida"
  exit 1
fi

if [ -z "$BROWSER" ]; then
  echo "La variable BROWSER no está definida"
  exit 1
fi

if [[ "$(docker images -q cypress/included:9.7.0 2> /dev/null)" == "" ]]; then
  echo "La imagen cypress/included:9.7.0 no existe"
  exit 1
else
  echo "El comando que se ejecutara es el siguiente"
  echo ""
  echo ""
  echo "docker run -it --network host -v $PATH_WORK_PROJECT:/e2e -w /e2e cypress/included:9.7.0 --spec $PATH_SPECS/*.spec.js --browser $BROWSER"
  echo ""
  echo ""
  echo "Ejecutando..."
fi

docker run -it --network host -v $PATH_WORK_PROJECT:/e2e -w /e2e cypress/included:9.7.0 --spec $PATH_SPECS/*.spec.js --browser $BROWSER