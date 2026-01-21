component {

	// Module Properties
	this.title              = "keywordtoolapi";
	this.author             = "Hardik Patel";
	this.webURL             = "";
	this.description        = "The Keyword Tool API Module for Dealstream";
	this.version            = "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup   = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint         = "keywordtoolapi";
	// Inherit Entry Point
	this.inheritEntryPoint  = true;
	// Model Namespace
	this.modelNamespace     = "keywordtoolapi";
	// CF Mapping
	this.cfmapping          = "";
	// Auto-map models
	this.autoMapModels      = true;
	// Module Dependencies
	this.dependencies       =   [];

	/**
	 * Configure the module
	 */
	function configure(){
		// module settings - stored in modules.name.settings
		settings = {
			apiKey:""
		};
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
