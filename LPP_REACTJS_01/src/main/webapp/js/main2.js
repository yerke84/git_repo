var Lander = React.createClass({
    render: function () {
        var info = "Lorem ipsum dolor sit amet... ";
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