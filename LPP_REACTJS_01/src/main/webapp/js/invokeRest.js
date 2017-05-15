"use strict";

var InvokeRestClass = React.createClass({

	getInitialState: function() {
		return {
			enteredValue: 'United States',
			result: null,
			list: []
		}		
	},
	
	getCities: function() {
	
		var ss = this.state.enteredValue.trim();		
		if(!ss) {
			this.setState({
				result: "Please, enter country name.",
				list: []
			})
		} else {
			/*
			 * axios({ method: "get", url: webServiceURL, headers: {
			 * 'crossDomain': true, dataType : 'jsonp' } })
			 * .then(function(response){ console.log(response.data);
			 * console.log(response.status); console.log(response);
			 * }).catch(function(error){ console.log(error.data);
			 * console.log(error.status); console.log(error); });
			 */
						
			var webServiceURL = 'http://services.groupkt.com/country/search?text=' + ss;
									
			$.ajax({
				url : webServiceURL,				
				success : function(resp){
					var ss = String(resp.RestResponse.messages[1]);
					this.setState({result : ss})
										
					var arr = resp.RestResponse.result;
					var mylist = [];
					
					for(var i = 0; i < arr.length; i++){
						mylist.push(arr[i].name + "(" + arr[i].alpha2_code + "/" + arr[i].alpha3_code +")");						
					}					
					this.setState({list : mylist})
															
				}.bind(this),				
				error : function(error){
					this.setState({result : error.status + ": " + error.statusText})
				}.bind(this)
			});
			
			
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
			<div className="listFnt"><ul>
			{
				this.state.list.map(function(item){
					return <li>{item}</li>					
				})					
			}
			</ul></div>
		  </div>
		)
	}
	
});

ReactDOM.render(<InvokeRestClass/>, document.getElementById("main_div_2"));