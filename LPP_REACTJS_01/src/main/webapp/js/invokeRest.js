var InvokeRestClass = React.createClass({

	getInitialState: function() {
		return {
			enteredValue: 'United States',
			result: null
		}		
	},
	
	getCities: function() {
	
		var ss = this.state.enteredValue.trim();
		var rr;
		if(!ss) {
			rr = "Please, enter country name."
		} else {
			rr = "{" + ss + "}"
		}
		
		this.setState({
			result: rr  
		})
	},
	
	handleChange(event) {
	    this.setState({
	    	enteredValue: event.target.value
	    })
	},
		
	render: function(){
		return(
		  <div>
		  	<p>
		  		<font className="cntryFnt">Country: </font>
		  		<input type="text" value={this.state.enteredValue} onChange={this.handleChange} className="listFnt cntryBorder"></input>
		  		&nbsp;
		  		<button className="searchBtn" onClick={this.getCities.bind()}>Get Cities List</button>
		  	</p>
			<div className="listFnt">{this.state.result}</div>
		  </div>
		)
	}
	
});

ReactDOM.render(<InvokeRestClass/>, document.getElementById("main_div_2"));