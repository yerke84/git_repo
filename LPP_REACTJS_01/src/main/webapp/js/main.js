var HelloWorld = React.createClass({

	render : function() {
		return React.createElement("h2", null, "Hello World!");
	},

});

var mydiv = document.getElementById('greeting-div');

ReactDOM.render(React.createElement(HelloWorld), mydiv);