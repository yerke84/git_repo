var React = require('react');
var ReactDOM = require('react-dom');

var Demo = React.createClass({
	
	render: function(){		
		return(				
				<div>TEST</div>
		)		
	}

});

// вывод
ReactDOM.render(<Demo />, document.getElementById('main_div'))