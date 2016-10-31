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

function updateStatus(linkId, value) {
  var linkParams = {
    id: linkId,
    link: {
      read: value
    }
  };

  $.ajax({
    url: "/api/v1/links/" + linkId,
    data: linkParams,
    type: "PUT"
  })
}

function changeStatus(){
  $("#link").on('click', '#change-status', function() {

    var $link = $(this).closest("#link");
    var linkId = $link.attr("data-id");
    var $status = $link.find("#status");
    var statusText = $status.text();

    if(statusText === "true") {
      $status.text("false");
      updateStatus(linkId, "false")

    } else if (statusText === "false") {
      $status.text("true");
      updateStatus(linkId, "true")
    }
  });
}


$(document).ready(function(){
  searchParams();
  changeStatus();
})
