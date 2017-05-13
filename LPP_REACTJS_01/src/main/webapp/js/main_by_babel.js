"use strict"; // этот код будет работать по современному стандарту ES5

var Calculator = React.createClass({

	render: function () {
		
		var mymath = [
			["C", "±", "%", "÷"],
			[7, 8, 9, "×"],
			[4, 5, 6, "-"],
			[1, 2, 3, "+"],
			[0, "", ",", "="]
		];
	
        return (
        		
            <div id="calculator">
            	<div id="result"></div>
            	<div id="mathtable"><table className="mtable">            	
            		{
            			mymath.map(function(oneRow, i){
            				var items = oneRow.map(function(oneItem, j){            					
            					return(
            							<td className={
            									oneItem === 0 ? 'myitem nolitem'
            											: j == 3 ? 'myitem myitem_orange'
            													: 'myitem'}>{oneItem}</td>
            					);            					
            				});
            				return (<tr className="myrow">{items}</tr>);            			
            			})            		
            		}            		
            	</table></div>            
            </div>
                        
        );
    }

});


ReactDOM.render(
        <Calculator />,
        document.getElementById('main_div')
);