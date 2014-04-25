  $(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  alert('hello')
  faye.subscribe('/users/2', function (data) {
    alert(data);
  });
});
