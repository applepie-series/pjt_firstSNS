
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// ↓要らない…？
// require("@rails-ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")
// require('jquery3')
// require('bootstrap/dist/js/bootstrap.min.js')

import 'bootstrap'
import './pjt_firstSNS/app/assets/stylesheets/custom.scss'
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require data-confirm-modal

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// require("trix")
// require("@rails/actiontext")
import Rails from 'rails-ujs';
Rails.start();
