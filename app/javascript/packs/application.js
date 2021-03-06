/** @format */

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
// External imports
import "bootstrap";
import swal from 'sweetalert';
import { initRoomCable } from "../channels/room_channel";
import { expandBtn } from "../plugins/expand-btn";
import { initScrollToBottom } from "../plugins/chat_scroll_bottom";
import { initTimer } from "../plugins/timer-topic";
import { previewImageOnFileSelect1, previewImageOnFileSelect2 } from "../plugins/photo_preview";
import { previewImageOnQuery1, previewImageOnQuery2 } from "../plugins/search_photo_preview"
import { initDisableVote } from "../plugins/disable_vote"

document.addEventListener("turbolinks:load", () => {
  initRoomCable();
  expandBtn();
  initScrollToBottom();
  initTimer();
  previewImageOnFileSelect1();
  previewImageOnFileSelect2();
  initDisableVote();
  previewImageOnQuery1();
  previewImageOnQuery2();
});
