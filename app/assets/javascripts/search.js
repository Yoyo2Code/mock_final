function searchParams() {
  $("#search").keyup(function(){
    var filter = $(this).val();

    $(".links").each(function() {

      if( $(this).find("#link-url").text().includes(filter) ) {
        $(this).show();
      } else if( $(this).find("#link-title").text().includes(filter) ) {
        $(this).show();
      } else {
        $(this).hide();
      };
    });
  });
}

function changeStatus(){
  $("#link").on('click', '#change-status', function() {

    var $link = $(this).closest("#link");
    var linkId = $link.attr("data-id");
    var $status = $link.find("#status");
    var statusText = $status.text();

    if(statusText === "true") {
      $status.text("false");
    } else if (statusText === "false") {
      $status.text("true");
    }
  });
}


$(document).ready(function(){
  searchParams();
  changeStatus();
})
