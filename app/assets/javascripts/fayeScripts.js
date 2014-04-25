  $(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  alert('subscribing!')
  faye.subscribe('/users/2', function (data) {
    eval(data);
  });
});
