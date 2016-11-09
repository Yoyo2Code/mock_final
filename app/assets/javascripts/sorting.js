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
      }
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
  });
}

function changeStatus(){
  $(".links").on('click', '#change-status', function() {

    var $link = $(this).closest("#link");
    var linkId = $link.attr("data-id");
    var $status = $link.find("#status");
    var statusText = $status.text();

    if(statusText === "true") {
      $status.text("false");
      updateStatus(linkId, "false");

    } else if (statusText === "false") {
      $status.text("true");
      updateStatus(linkId, "true");
    }

  });
}

function sortAlphabetically() {
  $("#alpha").on('click', function(){

    var $alphaDivs = $(".links").children();
      var alphabeticallyOrderedDivs = $alphaDivs.sort(function (a, b) {
          return $(a).find("#link-url").text() > $(b).find(".link-url").text();
      });
        $(".links").html(alphabeticallyOrderedDivs);
  });
}

function filterBy() {
  $(".sort").on('click', function(){
    var filter = $(this).text();

    var $statusDivs = $(".links").children();

    $statusDivs.each(function() {
      if( $(this).find("#status").text().includes(filter) ) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });
}

function addTags() {
  $('.links').on('click', '.add-tag', function(){
    var linkId = $(this).parent().attr('data-id');
    var tagInput = $(this).parent().find(".tag-form");
    var requestedTagNames = tagInput.val().split(',');
    var tagNames = requestedTagNames.map(function(t) {
      return t.trim();
    });

    updateTags(linkId,tagNames);
    var tags = tagNames.map(function(name) {
      return createTag(name);
    });

    $(this).parent().find('.link-tags').append(tags);
    // tagInput.append(tags)

    tagInput.text('');
  });
}

function updateTags(linkId, tagNames) {
  var linkParams = {
    id: linkId,
    link: {
      tags: tagNames
    }
  };

  $.ajax({
    url: "/api/v1/tags/" + linkId,
    data: linkParams,
    type: "PUT"
  });
}

function createTag(name) {
    return $("<br>"
    + "<div class='tag-data'"
    + "<button class='sort tag'>"
    + name
    + "</button>"
    + "<button class='delete-tag'>Delete Tag</button>"
    + "</div>"
    + "<br>");
}

function deleteTag() {
  $(".links").on('click', '.delete-tag', function() {
    var linkId = $(this).parent().parent().parent().attr("data-id");
    var tagDiv = $(this).parent();
    var tagId = tagDiv.attr("data-id");

    removeTag(linkId, tagId);

    tagDiv.remove();
  });
}

function removeTag(linkId, tagId) {
  var linkParams = {
    id: linkId,
    link: {
      tagId: tagId
    }
  };

  $.ajax({
    url: "/api/v1/tags/" + linkId,
    data: linkParams,
    type: "DELETE"
  });
}

function filterByTag() {
  $(".sort-tag").on('click', function(){
    var filter = $(this).text();

    var $statusDivs = $(".links").children();

    $statusDivs.each(function() {
      var allTags = $(this).find(".sort-tag");

      var tagNames = allTags.map(function(tagIndex) {
        return allTags[tagIndex].innerHTML;
      });

      var names = $.makeArray(tagNames);

      if( names.includes(filter) ) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });
}

$(document).ready(function(){
  searchParams();
  changeStatus();
  filterBy();
  sortAlphabetically();
  addTags();
  deleteTag();
  filterByTag();
});
