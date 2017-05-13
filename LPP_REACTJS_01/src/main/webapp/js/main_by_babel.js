"use strict"; // этот код будет работать по современному стандарту ES5

var Calculator = React.createClass({

	render: function () {
        var info = "1234567890 C ± + - ÷ × % AC !";
        return (
        		
            <div id="calculator"></div>
                        
        );
    }

});


ReactDOM.render(
        <Calculator />,
        document.getElementById('main_div')
);