var Lander = React.createClass({
    render: function () {
        var info = "1234567890+-/*=c";
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