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
  $("links").on('click', 'change-status', function() {
    var $link = $(this).closest(".link");
    var linkId = $link.attr("data-id");
    var $status = $idea.find("#status");
    var statusText = $status.text();
    if(statusText === "true") {
      debugger;
      $status.text("false");
    } else if (statusText === "false") {
      debugger;
      $status.text("true");
    }
  });
}


$(document).ready(function(){
  searchParams();
  changeStatus();
})
