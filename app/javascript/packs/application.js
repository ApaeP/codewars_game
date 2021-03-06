// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")

import { sizeUserCardElems } from '../components/card_user_elem_width.js'

$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    setTimeout(function(){
      $('.alert').fadeOut();
    }, 2500);
  })
  sizeUserCardElems();
})

import "controllers"
