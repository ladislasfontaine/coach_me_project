var mapFunction = function() {
  var map = L.map('map').setView([44.839719, -0.568707], 13);
  // create popup contents
  var customPopup = '<img src="https://www.parisinfo.com/var/otcp/sites/images/node_43/node_51/node_232/running-sur-piste-%7C-630x405-%7C-%C2%A9-fotolia/15674136-1-fre-FR/Running-sur-piste-%7C-630x405-%7C-%C2%A9-fotolia.jpg" class="coach_image" style="filter: brightness(0.4); width: 100%; object-fit: cover;"><div class="photo-profil"><img src="https://previews.123rf.com/images/veronawinner/veronawinner1904/veronawinner190400011/124072712-person-icon-in-line-style-man-symbol-isolated-on-white-background-simple-avatar-abstract-icon-in-bla.jpg" alt="Icon" class="profil-picture" style="height: 100px; width: 100px;"></div><div class="card-informations"><h6 class="card-title">Dona Keebler</h6><div class="price-index-coach">50€ / heure</div><div>Bordeaux</div><div class="coach-specialties"><span class="coach-specialty">Yoga</span></div></div>'

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  L.marker([44.839719, -0.568707]).addTo(map)
      .bindPopup(customPopup)
      .openPopup();

  L.marker([44.838906, -0.578909]).addTo(map)
      .bindPopup(customPopup);

  L.marker([44.856554, -0.583200]).addTo(map)
      .bindPopup(customPopup);

  L.marker([44.823445, -0.575991]).addTo(map)
      .bindPopup(customPopup);

  L.marker([44.833185, -0.571871]).addTo(map)
      .bindPopup(customPopup);

  L.marker([44.841462, -0.560713]).addTo(map)
      .bindPopup(customPopup);

  L.marker([44.849739, -0.604658]).addTo(map)
      .bindPopup(customPopup);

  L.marker([44.821862, -0.598993]).addTo(map)
      .bindPopup(customPopup);
};

// $(document).ready(mapFunction);
// $(document).on('page:load', mapFunction); // Classic Turbolinks
$(document).on('turbolinks:load', mapFunction); // Turbolinks 5

