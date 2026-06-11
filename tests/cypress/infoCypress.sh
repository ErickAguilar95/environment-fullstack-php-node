#!/bin/bash

if [[ "$(docker images -q cypress/included:9.7.0 2> /dev/null)" == "" ]]; then
  echo "La imagen cypress/included:9.7.0 no existe. Descargando..."
  docker pull cypress/included:9.7.0
else
  echo "La imagen cypress/included:9.7.0 ya existe. No es necesario descargarla."
fi

docker run -it --entrypoint=cypress cypress/included:9.7.0 info