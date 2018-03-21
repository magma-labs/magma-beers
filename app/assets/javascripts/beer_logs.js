$(document).on('turbolinks:load', () => {
  $('select').selectize({
    create: false,
    sortField: 'text',
    maxOptions: 10
  });
});
