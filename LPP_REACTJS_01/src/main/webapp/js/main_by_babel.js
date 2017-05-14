"use strict"; // этот код будет работать по современному стандарту ES5

var Calculator = React.createClass({

	// исходные данные
	getInitialState: function() {
		return {
			displayValue: "0"
		};		
	},

	doMath: function(item){		
		console.log(item);
	},
	
	
	// отрисовка
	render: function () {
		
		var mymath = [
			["C", "±", "%", "÷"],
			[7, 8, 9, "×"],
			[4, 5, 6, "-"],
			[1, 2, 3, "+"],
			[0, ",", "="]
		];
	
        return (
        		
            <center><div id="calculator_div">              
            	<div id="display_div">{this.state.displayValue}</div>
            	<div id="panel_div">
            		{
            			mymath.map(function(oneRow, i){
            				var items = oneRow.map(function(oneItem, j){            					
            					return(
            							<button
            								onClick={this.doMath.bind(null, oneItem)}
            								className={oneItem == 0 ? 'btn nbtn' : j == 3 || oneItem == '=' ? 'btn obtn' : 'btn'}>
            								{oneItem}
            							</button>
            					);            					
            				}.bind(this));
            				return (<div>{items}</div>);            			
            			}.bind(this))            		
            		}            		
            	</div>
            </div></center>
                        
        );
    }

});


ReactDOM.render(
        <Calculator />,
        document.getElementById('main_div')
);