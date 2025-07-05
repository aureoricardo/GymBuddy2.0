// This would be used for initializing Swiper or Stimulus if needed.
import Swiper from 'swiper/bundle';
import "@hotwired/turbo-rails"
import "leaflet"
import "maplibre-gl"
import "leaflet-maplibre-gl"


import 'swiper/css/bundle';

document.addEventListener('DOMContentLoaded', () => {
  new Swiper('.mySwiper', {
    direction: 'horizontal',
    loop: false,
    spaceBetween: 20,
    slidesPerView: 1,
  });
});
