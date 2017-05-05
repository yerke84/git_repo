$(document)
		.ready(
				function() {

					$("#rest_sync_btn")
							.click(
									function(event) {

										var cntry = $("#cntry").val();

										var webServiceURL = 'http://www.webservicex.net/globalweather.asmx/GetCitiesByCountry?CountryName='
												+ cntry;

										$.ajax({
											url : webServiceURL,
											type : "GET",
											dataType : "text",
											success : OnSuccess2,
											error : OnError2
										});

									});

					function OnSuccess2(data, textStatus, jqXHR) {
						document.getElementById('pid2').innerHTML = data;
					}

					function OnError2(jqXHR, textStatus, errorThrown) {
						document.getElementById('pid2').innerHTML = jqXHR.status
								+ ": " + jqXHR.statusText;
					}

					$("#soap_sync_btn")
							.click(
									function(event) {
										var n = $("#iin").val();

										var webServiceURL = 'http://192.168.90.4:8081/BPMCollection/BPMCollectionCustomer.asmx';
										var soapMessage = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:svc="http://svc.eubank.kz/">'
												+ '<soapenv:Header/>'
												+ '<soapenv:Body>'
												+ '<svc:GetCustomerData>'
												+ '<svc:IIN>'
												+ n
												+ '</svc:IIN>'
												+ '</svc:GetCustomerData>'
												+ '</soapenv:Body>'
												+ '</soapenv:Envelope>';

										$
												.ajax({
													url : webServiceURL,
													data : soapMessage,
													contentType : "text/xml;charset=UTF-8",
													type : "POST",
													dataType : "text",
													success : OnSuccess,
													error : OnError
												});

									});

					function OnSuccess(data, textStatus, jqXHR) {
						var ss = data.substring(
								data.lastIndexOf("<surname>") + 9, data
										.lastIndexOf("</surname>"));
						document.getElementById('pid').innerHTML = ss;
					}

					function OnError(jqXHR, textStatus, errorThrown) {
						document.getElementById('pid').innerHTML = jqXHR.status
								+ ": " + jqXHR.statusText;
					}

				});