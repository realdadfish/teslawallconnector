#!/usr/bin/env sh

export CONNECTOR_ROOT="/volume1/teslawallconnector"

folders=( "data/grafana" "data/grafana/dashboards" "data/prometheus" )
for i in "${folders[@]}"; do
  [ ! -d ${CONNECTOR_ROOT}/${i} ] && mkdir -p ${CONNECTOR_ROOT}/${i} \
  && echo "folder created ${CONNECTOR_ROOT}/${i}"
done

chown -R 65534:65534 ${CONNECTOR_ROOT}/data/prometheus # nobody userid
chown -R 472:472 ${CONNECTOR_ROOT}/data/grafana # grafana userid

dashboards="grafana/dashboards"
for i in $(ls $dashboards); do
  if [ ! -e "$CONNECTOR_ROOT/data/$dashboards/$i" ]; then
    cp "$dashboards/$i" "$CONNECTOR_ROOT/data/$dashboards"
  fi
done

docker-compose down && docker-compose -f docker-compose.yml up --build --remove-orphans -d

