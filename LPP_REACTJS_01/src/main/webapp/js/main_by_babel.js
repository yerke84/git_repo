"use strict"; // этот код будет работать по современному стандарту ES5

var Lander = React.createClass({
    render: function () {
        var info = Math.random() + "_--_1234567890+-/*=c";
        return(
            <div>
                <div className="info">{info}</div>
            </div>
        );
    }
});


ReactDOM.render(
        <Lander />,
        document.getElementById('main_div')
);