
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
import './app/javascript/packs/pjt_firstSNS/app/assets/stylesheets/custom.scss'
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require data-confirm-modal


// require("trix")
// require("@rails/actiontext")
import Rails from 'rails-ujs';
Rails.start();
