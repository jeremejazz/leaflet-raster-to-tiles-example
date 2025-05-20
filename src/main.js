import "leaflet/dist/leaflet.css";
import "./style.css";
import * as L from "leaflet";

import "leaflet-rastercoords";
import marker from "leaflet/dist/images/marker-icon.png";
import marker2x from "leaflet/dist/images/marker-icon-2x.png";
import markerShadow from "leaflet/dist/images/marker-shadow.png";

function init() {
  const container = document.getElementById("app");

  if (!container) throw new Error('There is no div with the id: "app" ');

  const height = 1024;
  const width = 1024;

  const imageDimensions = [width, height];

  const map = L.map(container, {
    center: L.latLng(0, 0),

    noWrap: true,
    crs: L.CRS.Simple,
  });

  L.tileLayer("/map/{z}/{x}/{y}.png", {
    maxZoom: 3,
  }).addTo(map);

  const rc = new L.RasterCoords(map, imageDimensions);

  map.setView(rc.unproject([width, height]), 1);

  // include default marker icons in production build
  const icon = L.icon({
    iconUrl: marker,
    iconRetinaUrl: marker2x,
    shadowUrl: markerShadow,
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41],
  });

  L.marker(rc.unproject([408, 504]), { icon }).addTo(map);
}

init();
