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
			jquery.ajax({			
				url : webServiceURL,
				type : "GET",
				dataType : "text",
				success : OnSuccess,
				error : OnError
			});
		}
		
	},
	
	OnSuccess: function(data, textStatus, jqXHR) {		
		this.setState({
			result: data  
		})
	},
	
	OnError: function(jqXHR, textStatus, errorThrown) {
		this.setState({
			result: jqXHR.status + ": " + jqXHR.statusText  
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