//основной класс
var MyTimer = React.createClass({
	
	// исходные данные
	getInitialState: function(){
		return{
			begin : "",
			result : ''
		}
	},
	
	// данный метод выполняется при загрузке компонента
	componentDidMount: function(){
		this.mytimer = setInterval(this.invokeWS, 5 * 1000); // запускаем
																// таймер
															// и периодично
															// вызываем функцию
															// invokeWS
	},
	
	// данный метод выполняется перед удалением компонента из страницы
	componentWillUnmount: function(){
		clearInterval(this.mytimer); // останаливаем таймер
	},
	
	// вызов сервиса
	invokeWS: function(){
		// REST JERSEY сервис, который возвращает случайные числа
		var webServiceURL = 'http://localhost:8081/WS_SYNC_REST_JERSEY_MAVEN_MYSQL/link_in_web_xml/ws_test_class/get_random';
		
		$.ajax({
			url : webServiceURL,				
			success : function(resp){
				this.setState({begin : this.formatDate(new Date), result: resp})				
			}.bind(this),				
			error : function(error){
				this.setState({begin : this.formatDate(new Date), result : error.status + ": " + error.statusText})
			}.bind(this)
		});				
	},
	
	// формат даты
	formatDate: function (date){
		var i = date.getMonth() + 1;
		return this.leadingNil(date.getDate()) + "." + this.leadingNil(i) + "." + date.getFullYear() + " " + 
		this.leadingNil(date.getHours()) + ":" + this.leadingNil(date.getMinutes()) + ":" + this.leadingNil(date.getSeconds());
	},
	
	leadingNil: function(k){
		return k < 10 ? "0" + k : "" + k;
	},	
		
	// отрисовка
	render: function(){		
		return(				
				<p><font className='titleFnt'>Service was called at:</font> <font className='resultFnt'>{this.state.begin}</font><br/>
				<font className='titleFnt'>Result of service: </font><font className='resultFnt'>{this.state.result}</font></p>
		)		
	}

});

// вывод
ReactDOM.render(<MyTimer />, document.getElementById('main_div_3'))