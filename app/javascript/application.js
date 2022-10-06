// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

import "./src/jquery"
import "./src/jquery-ui"
import "./action/jquery-action"
import "./action/js-action"
import "./action/jquery-ui"
import "./action/select2"

/* this function is used to convert array into string for thag input field */
function set_tag_string(){
var set_string = $('#blog_tag_list').val().join(',');
$("#tag_list").val(set_string);
}

/* this function is used for the on click blog submit button that time it set the value of tags by calling the function */
$(document).ready(function() {
    $('.blog_submit').click(function() {
        set_tag_string();
    });
});