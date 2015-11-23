$(document).ready(function(){
  $('.slider').slider({ indicators: false });
  $('.collapsible').collapsible({ accordion : false });

  $('#orders_filter_status').on('change', function () {
  var currentStatus = this.value;
  $robots.each(function (index, robot) {
    $robot = $(robot);
    if ($robot.data('department') === currentDepartment) {
      $robot.show();
    } else {
      $robot.hide();
    }
  });
});

});
