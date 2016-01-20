// Calendar
$(document).ready(function() {
  $.get('/api/v1/user_events.json', function(data) {
    $('#calendar').fullCalendar({
      height: 450,
      editable: true,
      header:{
        left: 'month agendaWeek agendaDay',
        center: 'title',
        right: 'today prev,next'
      },
      events: data.events,
      eventClick: function(calEvent) {
        alert(['Event: ' + calEvent.title + '\n' +
          'Description: ' + calEvent.editable
          ]);
      }
    });
    $('#calendar').fullCalendar({
    });
  });
});