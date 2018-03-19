$(document).on('turbolinks:load', () => {
  $('select').selectize({
    create: false,
    sortField: 'text',
    maxOptions: 10
  });

  $("input[name='beer_log[log_date]']").val(new Date());
});
