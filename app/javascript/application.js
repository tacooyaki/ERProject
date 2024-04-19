import "@hotwired/turbo-rails";
import "./controllers";
import "trix";
import "@rails/actiontext";
import Rails from "@rails/ujs";
import $ from "jquery";

Rails.start();

window.$ = $;
window.jQuery = $;

import "./address_handler";
