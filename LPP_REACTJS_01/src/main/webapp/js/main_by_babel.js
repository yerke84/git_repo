"use strict"; // этот код будет работать по современному стандарту ES5

var Calculator = React.createClass({

	// исходные данные
	getInitialState: function() {
		return {
			displayValue: "0",
			operator:     null,
			prevValue:    null,
			waitOperator: false
		};		
	},

	doMath: function(item){
		
		// кнопка C
		if(item == 'C'){
			this.setState({
				displayValue: "0",
				operator:     null,
				prevValue:    null,
				waitOperator: false
			})	
		}
		
		// =
		if(item == '='){
			var a = this.state.prevValue;
			var b = parseFloat(this.state.displayValue);			
			var o = this.state.operator;
					
			if(a && b && o){
				var r;
				switch(o) {
				  case '+': r = a + b; break;
				  case '-': r = a - b; break;
				  case '×': r = a * b; break;
				  case '÷': r = a / b; break;				
				}
				this.setState({					
					displayValue: String(r),
					operator:     null,
					prevValue:    null,
					waitOperator: false
				})				
			}	
		}		
				
		// операторы
		if(item == '×' || item == '÷' || item == '-' || item == '+'){
			this.setState({						
				operator:     item,				
				waitOperator: true,
				prevValue:    parseFloat(this.state.displayValue)
			})	
		}
		
		// цифры
		if(item >=0 && item <=9){
			if(this.state.waitOperator){
				this.setState({					
					displayValue: String(item),
					waitOperator: false
				})
			}else{			
				this.setState({
					displayValue: this.state.displayValue == '0' ? String(item) : this.state.displayValue + String(item)
				})
			}
			
			
		}
		
		// dot
		if(item == '.'){
			if(this.state.waitOperator){
				this.setState({					
					displayValue: '0' + String(item),
					waitOperator: false
				})
			}else if(this.state.displayValue.indexOf('.') == -1){
				this.setState({
					displayValue: this.state.displayValue + String(item),
					waitOperator: false
				})				
			}				
		}
		
		// ±
		if(item == '±'){
			this.setState({
				displayValue: this.state.displayValue.charAt(0) == '-' ? this.state.displayValue.substr(1) : '-' + this.state.displayValue
			})
		}
		
		// %
		if(item == '%'){
			var value = parseFloat(this.state.displayValue);
			this.setState({
				displayValue : String(value/100)				
			})			
		}
		
	},
	
	
	// отрисовка
	render: function () {
		
		var mymath = [
			["C", "±", "%", "÷"],
			[7, 8, 9, "×"],
			[4, 5, 6, "-"],
			[1, 2, 3, "+"],
			[0, ".", "="]
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

// вывод
ReactDOM.render(
        <Calculator />,
        document.getElementById('main_div')
);