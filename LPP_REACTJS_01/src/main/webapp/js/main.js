"use strict";

var HelloWorld = React.createClass({

	render : function() {
		return React.createElement("h1", null, "Hello World!");
	},

});

var mainElement = document.getElementById('greeting-div');

ReactDOM.render(React.createElement(HelloWorld), mainElement);