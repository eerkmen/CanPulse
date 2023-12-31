import jsCalendar from './jsCalendar.js';
document.addEventListener('DOMContentLoaded', (event) => {
    var calendarElement = document.querySelector("#my-calendar");
    var appointmentDateInput = document.getElementById("appointment-date");

    // Only execute if the required elements are present
    if (calendarElement && appointmentDateInput) {
        var myCalendar = jsCalendar.new(calendarElement);

        // Get the current date
        var currentDate = new Date();

        // Get the date 6 months from now
        var futureDate = new Date(
            currentDate.getFullYear(),
            currentDate.getMonth() + 6,
            currentDate.getDate()
        );

        // Set min to the current date
        myCalendar.min("now");

        // Set max to the date 6 months from now
        myCalendar.max(futureDate);

        // Initialize selectedDate variable
        let selectedDate = null;

        myCalendar.onDateClick(function(event, date){
            var now = new Date();
            now.setHours(0, 0, 0, 0);

            if(date >= now) {
                var formattedDate = date.toISOString().slice(0, 10);
                appointmentDateInput.value = formattedDate;

                // remove selected class from the previously selected date
                if (selectedDate) {
                    myCalendar.unselect(selectedDate);
                }

                // select the new date and add it to selectedDate
                myCalendar.select(date);
                selectedDate = date;
            }
        });

        myCalendar.onMonthChange(function(){
            // If a date is selected, reselect it to highlight
            if (selectedDate) {
                if(myCalendar.isSelected(selectedDate)){
                    myCalendar.select(selectedDate);
                }
            }
        });
    }
});
