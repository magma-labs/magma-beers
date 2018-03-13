$(document).on('turbolinks:load',function() {
  $('select').selectize({
    create: false,
    sortField: 'text',
    maxOptions: 10
  });
});
