"use strict"; // этот код будет работать по современному стандарту ES5

var Calculator = React.createClass({
	
	getInitialState:function () {
		return {
			mymath:[
				["C", "±", "%", "÷"],
				[7, 8, 9, "×"],
				[4, 5, 6, "-"],
				[1, 2, 3, "+"],
				[0, ",", "="]
			]
		}		
	},

	render: function () {        
        return (
        		
            <div id="calculator">
            	<div id="result"></div>
            	<div id="mathtable">
            	
            		{this.state.mymath.map(
            				function(row){
            					var items = row.map(
            							function(operand){
            								return(
            										<div>{operand}</div>
            								)
            					})
            					
            					return(
            							<div>{items}</div>
            					)
            				}            		            				
            		)}
            		
            	</div>            
            </div>
                        
        );
    }

});


ReactDOM.render(
        <Calculator />,
        document.getElementById('main_div')
);