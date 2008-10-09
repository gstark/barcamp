
$(document).ready(
  function()
  {
    $(".head").click(
      function()
      {
        $(this).next().slideToggle("slow");
        $(this).toggleClass("active");
      } 
    ).next().hide();

    $("#wrapper").corner ("20px");
  }
);
