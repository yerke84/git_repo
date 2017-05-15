"use strict";

var InvokeRestClass = React.createClass({

	getInitialState: function() {
		return {
			enteredValue: 'United States',
			result: null
		}		
	},
	
	getCities: function() {
	
		var ss = this.state.enteredValue.trim();		
		if(!ss) {
			this.setState({
				result: "Please, enter country name."  
			})
		} else {
			var webServiceURL = 'http://www.webservicex.net/globalweather.asmx/GetCitiesByCountry?CountryName=' + ss;
			
			
			/*
			$.ajax({
				url : webServiceURL,
				type : "GET",
				dataType : "jsonp",
				crossDomain: true,				
				success : function(resp){					
					this.setState({result: String(resp)});					
				}.bind(this),				
				error : function(error){
					console.log(error.status);					
					console.log(error.statusText);
					console.log(error.string);
					//this.setState({result: jqXHR.status + ": " + jqXHR.statusText});					
				}.bind(this)
			});
			*/
		}
		
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
		  		<input type="text" value={this.state.enteredValue} onChange={this.handleChange} id="inputClassFnt"></input>
		  		&nbsp;
		  		<button className="searchBtn" onClick={this.getCities.bind()}>Get Cities List</button>
		  	</p>
			<div className="listFnt">{this.state.result}</div>
		  </div>
		)
	}
	
});

ReactDOM.render(<InvokeRestClass/>, document.getElementById("main_div_2"));