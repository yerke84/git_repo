var InvokeRestClass = React.createClass({

	getInitialState: function() {
		return {
			enteredValue: 'United States',
			result: null
		}		
	},
	
	render: function(){
		return(
		  <div>
		  	<p>
		  		<font className="cntryFnt">Country: </font>
		  		<input type="text" value={this.state.enteredValue} className="listFnt cntryBorder"></input>
		  		&nbsp;
		  		<button className="searchBtn">Get Cities List</button>
		  	</p>
			<div className="listFnt">{this.state.result}</div>
		  </div>
		)
	}
	
});

ReactDOM.render(<InvokeRestClass/>, document.getElementById("main_div_2"));