var MyMainClass = React.createClass({

	render : function() {
		return React.createElement("h2", null, "!!Hello World!");
	},

});

// final render
var mydiv = document.getElementById('main_div');
ReactDOM.render(React.createElement(MyMainClass), mydiv);