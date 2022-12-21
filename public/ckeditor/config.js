/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

 CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.filebrowserBrowseUrl = 'http://localhost:8080/tempoacademy/public/ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = 'http://localhost:8080/tempoacademy/public/ckfinder/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = 'http://localhost:8080/tempoacademy/public/ckfinder/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = 'http://localhost:8080/tempoacademy/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = 'http://localhost:8080/tempoacademy/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = 'http://localhost:8080/tempoacademy/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
	// config.filebrowserBrowseUrl = 'https://tempocenter.000webhostapp.com/public/ckfinder/ckfinder.html';
	// config.filebrowserImageBrowseUrl = 'https://tempocenter.000webhostapp.com/public/ckfinder/ckfinder.html?type=Images';
	// config.filebrowserFlashBrowseUrl = 'https://tempocenter.000webhostapp.com/public/ckfinder/ckfinder.html?type=Flash';
	// config.filebrowserUploadUrl = 'https://tempocenter.000webhostapp.com/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
	// config.filebrowserImageUploadUrl = 'https://tempocenter.000webhostapp.com/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
	// config.filebrowserFlashUploadUrl = 'https://tempocenter.000webhostapp.com/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
};
