# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap" # @5.3.5
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "leaflet", to: "https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
pin "maplibre-gl", to: "https://unpkg.com/maplibre-gl@2.4.0/dist/maplibre-gl.js"
pin "leaflet-maplibre-gl", to: "https://unpkg.com/maplibre-gl-leaflet@0.0.14/leaflet-maplibre-gl.js"
