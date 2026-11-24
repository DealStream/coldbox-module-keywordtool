component {
	processingdirective preserveCase=true;

	property name="settings" inject="coldbox:moduleSettings:keywordtoolapi";
	property name="controller" inject="coldbox";

    KeywordTool function init() {
		endpoint 	= "https://api.keywordtool.io/v2/search";
		version 	= "v1";
		return this;
	}


	public struct function getKeywordVolume(required array keyword){
		var cfhttp = {};
		var  requestBody = {
			"keyword": arguments.keyword,
		};
		
		http url="#endpoint#/volume/google?apikey=#settings.apiKey#" method="POST" result="cfhttp" {
			httpparam type="header" name="Content-Type" value="application/json";
			httpparam type="body" value="#serializeJSON(requestBody)#";
		}
		return parseResponse(cfhttp);
		var resultJsonFilePath = getDirectoryFromPath( getCurrentTemplatePath() ) & "keywordtoolresponse.json";
		var cfhttp = fileRead( resultJsonFilePath );
		return parseResponse( { filecontent: cfhttp } );
		
	} 

	private any function parseResponse(required struct response) {
		
		var exception = { type:"KeywordToolAPI" }
		
		try {
			var apiResult = deserializeJSON(arguments.response.filecontent);
		} catch (Any e) {
			exception.message = "Deserialization Error"
			exception.detail = serializeJSON(arguments.response);
			throw(argumentCollection:exception);
		}
		if( structKeyExists( apiResult, "error" ) ) {
			exception.message = "API Error: #apiResult.error.message#";
			exception.detail = serializeJSON(apiResult);
			throw(argumentCollection:exception);
		}
									
		return apiResult;  
	}

	public struct function getKeywordSuggestion(required string keyword, string countryCode){
		var cfhttp = {};
		var  requestBody = {
			"keyword": arguments.keyword,
		};
		if(len(arguments.countryCode)>0){
			requestBody['country'] = arguments.countryCode;
		}
		http url="#endpoint#/suggestions/google?apikey=#settings.apiKey#" method="POST" result="cfhttp" {
			httpparam type="header" name="Content-Type" value="application/json";
			httpparam type="body" value="#serializeJSON(requestBody)#";
		}
		return parseResponse(cfhttp);
	}
}